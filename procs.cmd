@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $fh;
open $fh, '-|', 'wmic process get processid,parentprocessid,commandline';
  
while (<$fh>)
{
    my $line = $_;
    if ( $line =~ /^(.*)  +(\d+)  +(\d+)/ )
    { 
       my ($ppid, $pid, $exe) = ($2, $3, $1);
       $exe =~s/ +/ /g;
       print "$ppid\t$pid\t $exe\n";
    }  
}
__END__
