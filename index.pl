#!/usr/bin/perl

use v5.10; 
use CGI::FastTemplate;    
use Data::Dumper::Names;
use strict; 
my $dir = '/var/www/html/indexpl';
print "Content-type: text/html\n\n";
use lib '/var/www/html/indexpl';
require mylib;

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

