@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $fh;
open $fh, '-|', 'handle.exe';

my ($pid, $exe );
while (<$fh>)
{
    my $line = $_;

    if ( $line =~ /^(.*) pid: (\d+) (.*)$/ )
    { 
       ($exe, $pid) = ($1, $2);
    }
    elsif ( $line =~ / *..: File +\(.*?\) +(.*)$/ )
    {
       print "$pid\t$exe\t$1\n";
    }
}
__END__
