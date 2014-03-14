#!/usr/bin/perl -w

# findTitleOfURL:  A basic web scraping script that returns all <title> tags from the variable $url
# By Brian Neary

## PHASE 0: SETUP ##
use strict;
use warnings;
use WWW::Mechanize;   # WWW::Mechanize is a commonly used Perl web scraping library.
#########################################################################################################
# URLs (we can draw our html content from any valid source):                                            #
#########################################################################################################
#my $url = 'http://www.census.gov/population/www/documentation/twps0027.html';         # out of date
#my $url = 'http://factfinder2.census.gov/faces/tableservices/jsf/pages/productview.xhtml?src=bkmk';
#my $url = 'http://www.thestar.com/feeds.articles.news.gta.rss';
my $url = 'http://www.brianneary.net';
#########################################################################################################

## PHASE 1: ACQUIRE DATA FROM THE WEB ##

# Here we instantiate a WWW::Mechanize object.  This will be the entity we interact with to glean web data 
my $mech = WWW::Mechanize->new();
$mech -> get($url);

my $content = $mech->content;

## PHASE 2: PARSE CAPTURED DATA ##

my @lines = split /\n/, $content;

foreach my $line (@lines)
{
   # If the line contains <title>, print the line
   if ($line =~ /<title>/i)
   {
      print $line . "\n";
      last;
   }                        
}