#!/usr/bin/perl
my $dir;
BEGIN { $ENV{'SCRIPT_FILENAME'} =~ m/(.*\/).*/;  $dir = $1; }

use v5.10; 
use CGI::FastTemplate;    
use Data::Dumper::Names;
use strict; 

print "Content-type: text/html\n\n";
use lib $dir;
use mylib;

my $tpl = new CGI::FastTemplate($dir.'/tmpl');
$tpl->define( main    => 'main.html');
              
$tpl->assign( TITLE => mylib::title(),
              TAGS  => mylib::tags(),
			ALL_TAGS => mylib::all_tags(),
              TEXT  => mylib::text() );              
$tpl->parse(CONTENT   => 'main');
$tpl->print();


sub d($$)
{
	print STDOUT Dumper @_;
	print STDERR Dumper @_;
}

