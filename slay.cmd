@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $arg = shift @ARGV;
my $cmd = "taskkill ";

if ( $arg eq "-9" )
{
    $cmd .= " /F ";
    $arg = shift @ARGV;
}

if ( $arg =~ /^(\d+)$/ )
{
    $cmd .= " /PID $arg ";
}
else
{
    $cmd .= " /IM $arg";
}

my $fh;
open $fh, '-|', $cmd;
while (<$fh>) { print "$_"; }

exit;
__END__
