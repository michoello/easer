@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $fh;
open $fh, '-|', 'netstat -anob';

while (<$fh>)
{
    my $line = lc($_);

    $line =~ s/[\r\n]//g;

    if ( $line =~ /^ *(tcp|udp)/ )
    {
        print "\n";
    }



    if ( $line =~ /^ *\[(.*)\] *$/ )
    {
        print "\t$1";
    }
    else
    {
        print "$line";
    }


}
__END__
