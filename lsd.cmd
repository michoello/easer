@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $fh;

my $path = join(' ', @ARGV) || "";

$path =~s/(\/)+/\\/g; $path =~s/(\\)+/$1/g;

exit 0 unless ( -d $path );

open $fh, '-|', "ls $path";
  
while (<$fh>)
{
    my $line = $_;
    $line = $path.'\\'.$line;
    $line =~s/(\\)+/$1/g;
    print "$line";
}
__END__
