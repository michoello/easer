@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $raArgs = \@ARGV;

my $pred = scalar @ARGV ? shift @ARGV : "";
  
while (<STDIN>)
{
    my $line = $_; $line =~ s/[\n\r]//g;

    my $cmd; 
    if ( $pred eq "" )
    {
        $cmd = $line;
    }
    elsif ( $line =~ /^$pred (.*)/ )
    {
        $cmd = $1;
    }

    if ( $cmd )
    {
        my $fh;
        open $fh, '-|', $cmd;
        while (<$fh>) { print "$_"; }
    }
    else
    {
        print $line, "\n";
    }
}


exit;
__END__
