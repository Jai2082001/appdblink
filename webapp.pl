#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use CGI::Lite;
use DBI;
use DBD::mysql;
use IO::Socket;

my($cgi,$db,%form,$ip,$pw,$query,$ref,$sth,%server,$link,$key,$row,$desc,$host_ip,$port,$bg,$done,$domain);

# database server IP address
$ip   = "10.173.???.106";

# database server password
$pw   = 'Secret55!';

$server{100} = "Windows Server:135,";
$server{101} = "Ubuntu Server:22";
$server{102} = "ESXi 01:443";
$server{103} = "ESXi 02:443";
$server{104} = "vSphere Server:443";
$server{105} = "CentOS Web Server 01:22";
$server{106} = "CentOS DB Server 01:22";
$server{107} = "CentOS Web Server 02:22";

$cgi  = new CGI::Lite();
$db   = DBI->connect("dbi:mysql:appdb;$ip","webapp",$pw);

$cgi->set_directory("/var/www/html/tmp");
$cgi->set_platform("UNIX");
$cgi->set_file_type("handle");

#collect cgi data
#load default information
%form = $cgi->parse_form_data();

getHeader();

if(!defined($db)){
	print("<P>DB Connection Issue!</P><P>$DBI::errstr</P>\n");
}
##############################################################################
# assess form detail
#
print("<DIV>");
print("<H4 CLASS=\"text-light\"> Selecting a user's page could take a few
minutes to load, please be patient.  Green background means the server is alive,
red background means the server is not alive.</H2>\n");
print("</DIV>");
print("<DIV>");
print("<TABLE CLASS=\"table table-sm table-light\">");

if($form{'action'} eq "pick"){
	$query = sprintf("SELECT * FROM users WHERE id=%d;",$form{'id'});
		
	$sth = $db->prepare($query);
	$sth->execute();

	if($ref = $sth->fetchrow_hashref()){
		$row     = 0;
		$done    = 0;
		$domain  = $ref->{'ip'};
		$domain  =~ s/0$//;

		print("<TR>\n");
		print("<TH>Student:</TH>\n");
		print("<TH>Status:</TH>");
		print("</TR>\n");

		print("<TR>\n");
		print("<TD ROWSPAN=2>",$ref->{'student_id'}," (",$host_ip,")</TD>\n");
		foreach $key(keys(%server)){
			$host_ip = sprintf("%s%s",$domain,$key);

			$row++;
			($desc,$port) = split(/:/,$server{$key});

			if(checkPort($host_ip,$port)){
				$bg = "class=\"table-success\"";
			}
			else{
				$bg = "class=\"table-danger\"";
			}

			print("<TD ",$bg,">",$desc," (",$host_ip,")</TD>\n");

			if($row >= 4 && !$done){
				print("</TR>\n<TR>\n");
				$done = 1;
			}
		}
		print("</TR>\n");
	}
}
else{
	print("<TR>\n");
	print("<TH>Student</TH>\n");
	print("<TH>IP</TH>\n");
	print("</TR>\n");

	$query = sprintf("SELECT * FROM users ORDER BY student_id;");
		
	$sth = $db->prepare($query);
	$sth->execute();

	
	while($ref = $sth->fetchrow_hashref()){
		$link = sprintf("<A HREF=\"/cgi-bin/webapp.pl?action=pick&id=%d\">%s</A>",$ref->{'id'}, $ref->{'student_id'});

		print("<TR>\n");
		print("<TD>",$link,"</TD>\n");
		print("<TD>",$ref->{'ip'},"</TD>\n");
		print("</TR>\n");
	}
}

print("</TABLE>\n");
print("</DIV>\n");
# form detail
#
getFooter();

exit(0);
#=============================================================================
#
# Subroutines:
#
# checkPort ( IP, PORT)
#
# Returns 1 on success and 0 on failure.  Checks to see if the port specified is
# open or not.
#
sub checkPort{
	my($ip,$port) = @_;
	my($result) = 1;

	my($sock)   = IO::Socket::INET->new(
		PeerHost => $ip,
		PeerPort => $port,
		Timeout  => 5,
		Proto    => 'tcp',
		Type     => SOCK_STREAM) or $result = 0;

	if($sock){
		close($sock);
		$result = 1;
	}
	else{
		$result = 0;
	}

	return($result);
}
#
# getHeader()
#
# Outputs HTML and BootStrap formating.
#
sub getHeader{
   print("Content-type: text/html; charset=UTF8\n\n");
	print("<HTML LANG=\"en\">\n");
	print("<HEAD>\n");
	print("	<TITLE>WebApp</TITLE>\n");
	print("	<META CHARSET=\"utf-8\">\n");
	print("	<META NAME=\"viewport\" CONTENT=\"width=device-width, initial-scale=1\">\n");
	print("	<META NAME=\"description\" CONTENT=\"WebApp\">\n");
	print("	<META NAME=\"author\" CONTENT=\"agignac\@conestogac.on.ca\">\n");
	print("	<LINK REL=\"stylesheet\" HREF=\"/css/bootstrap.min.css\">\n");
	print("	<LINK REL=\"stylesheet\" HREF=\"/css/bootstrap.css\">\n");
	#print("   <SCRIPT SRC=\"/bootstrap/js/jquery-3.5.1.js\"></SCRIPT>\n");
	print("   <SCRIPT SRC=\"/js/bootstrap.js\"></SCRIPT>\n");
   
   print("<SCRIPT>\n");
   print("\$('#myModal').on('shown.bs.modal', function () {\n");
   print("  \$('#myInput').trigger('focus')\n");
   print("})\n");
   print("</SCRIPT>\n");


	print("</HEAD>\n");
	print("<BODY CLASS=\"bg-secondary\">\n");
   print("<FORM METHOD=\"post\" ACTION=\"/cgi-bin/webapp.pl\">\n");
   print("<DIV CLASS=\"container\" ID=\"container\">\n");
   print("<P CLASS=\"lead text-light\">\n");
   print("<H2 CLASS=\"text-light\">SYST8111: WebApp</H2>\n");
   print("</P>\n");
}
#
# getFooter()
#
# Outputs HTML and bootstrap information that closes off the definitions defined
# in "getHeader"
#
sub getFooter{
   print("</DIV>\n");
   print("</FORM>\n");
   print("</BODY>\n");
   print("</HTML>\n");
}

