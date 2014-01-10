@rem ------------------------------------------------------------------------------

@if "%_echo%"=="" echo off

perl.exe -w -x %~f0 %*
exit /b

#!perl
#line 11
use strict;

my $raArgs = \@ARGV;
  
while (<STDIN>)
{
    my $line = $_; $line =~ s/[\n\r]//g;

    my $raLine = [ split "\t", $line ];
    
    my $raRes = [];
    for ( my $i = 0; $i < scalar @$raArgs; ++$i )
    {
       my $s;
       $s = $raArgs->[$i];
       $s =~ s/_(\d+)/$raLine->[$1-1]/gx;
       push @$raRes, $s;
    }
   
    print $line, "\n";
    my $newline = join( " ", @$raRes);
    $newline =~s/,/\n/g;
    print $newline, "\n";
}


exit;
__END__
