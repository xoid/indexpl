#!/usr/bin/perl

use v5.10; 
use CGI::FastTemplate;    
use Data::Dumper::Names;
use strict; 
print "Content-type: text/plain\n\n";
use lib '/root/indexpl';
use mylib;

my $tpl = new CGI::FastTemplate("tmpl");
$tpl->define( main    => "main.tpl",
              row     => "table_row.tpl",
              all     => "table_all.tpl");
              
$tpl->assign( TITLE => mylib::title(),
              TAGS  => mylib::tags(),
              TEXT  => mylib::text() );              
              



sub d($$)
{
	print STDOUT Dumper @_;
	print STDERR Dumper @_;
}

