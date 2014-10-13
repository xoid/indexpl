#!/usr/bin/perl

use v5.10;
use CGI::FastTemplate;
use strict;
use mylib;

my $tpl = new CGI::FastTemplate("tmpl");
$tpl->define( main    => "main.tpl",
              row     => "table_row.tpl",
              all     => "table_all.tpl");
              
$tpl->assign( TITLE => mylib::title(),
              TAGS  => mylib::tags(),
              TEXT  => mylib::text() );              
              



