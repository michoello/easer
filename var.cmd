@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $raArgs = \@ARGV;
my $args = join(" ", @ARGV);

my $vardir = $0; $vardir =~ s/[^\\\/]*$//;

if ( $args =~ /^ *$/ )
{
    my @varlist = `ls $vardir | grep \``;
    for my $var ( @varlist )
    {
       chomp $var;
       open my $fh, "$vardir/$var";
       $var =~ s/.cmd$//g;
       print "$var";
       while( <$fh> ) {print "\t-> ", $_; }
    }
}
elsif ( $args =~ /^([^ ]+) *= *(.*) *$/ ) 
{
    my $var = $1;
    my $val = $2;
    
    if ( $val eq "" )
    {
        system( "rm $vardir\`$var.cmd" );
    }
    else 
    {
        print "`", $var, " -> ", $val, "\n";
        open my $fh, ">$vardir\`$var.cmd\n";
        print $fh $val, "\n";
        close $fh;
    }
}

