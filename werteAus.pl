#!/usr/bin/perl -w
use IPC::Open2;
use FileHandle;
use IO::Select;

$file="Adressen.gml";
open(FILE,$file); 
my $str="";
my $nr="";
my $zusatz="";
my $pos="";
#$cmd="cs2cs -f \"%.6f\" +init=epsg:25832 +to +init=epsg:4326";




foreach my $line (<FILE>) {

    if ($line=~/\<fme:strname\>(.*)\<\/fme:strname\>$/) {
        $str=$1;
    }
    if ($line=~/^<fme:hausnr>(.*)<\/fme:hausnr>$/) {
        $nr=$1;
    }
    if ($line=~/^<fme:zusatz>(.*)<\/fme:zusatz>$/) {
        $zusatz=$1;
    }
    if ($line=~/^<gml:pos>(.*) (.*)<\/gml:pos>$/) {
        $pos="$1 $2";
    }
    if ($line=~/^<fme:featureMember>$/) {
        print "$pos\t$str\t$nr$zusatz\n";
        $str="";
        $nr="";
        $zusatz="";
        $pos="";
    }
    #print $line;
}
close(FILE);
