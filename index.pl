#!/usr/bin/perl

use v5.10; 
use Module::Reload;
use CGI::FastTemplate;    
use strict; 

my $dir = '/var/www/html/indexpl';
BEGIN{ $dir = '/var/www/html/indexpl'; }


use lib $dir;
use mylib;

Module::Reload->check;
d 'DIR ', $dir;
#d(\%ENV);
#d(@ARGV);
#my %get_parameters  = $r->args;
#d(\%get_parameters);
my $tpl = new CGI::FastTemplate($dir.'/tmpl');
$tpl->define( main    => 'main.html');
              
$tpl->assign( TITLE => mylib::title(),
              TAGS  => mylib::tags(),
		   ALL_TAGS => mylib::all_tags(),
              TEXT  => mylib::text(),
			ERRORS  => system('since /var/log/httpd/error_log')
			);              
$tpl->parse(CONTENT   => 'main');
print "Content-type: text/html\n\n";
$tpl->print();


