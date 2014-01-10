@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

print "Hello: ", join (",", @ARGV), "\n";

my $fh;
die "SUOPE" unless open $fh, "-";
  
while (<STDIN>)
{
    print "[$_]\n";
}


exit;
__END__
