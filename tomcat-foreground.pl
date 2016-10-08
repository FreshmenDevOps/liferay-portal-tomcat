#!/usr/bin/env perl

$file = '/usr/sbin/dliferay-portal-tomcat-6.1.2-ce-ga3';

open $fh, '+<:encoding(UTF-8)', $file;

chomp(@lines = <$fh>);

for ($i=0; $i<scalar @lines;++$i) {
  if(@lines[$i] =~ /catalina\.out/) {
    for($j = $i-1;;++$j) {
      if($j == $i-1) {
        @lines[$j] =~ s/\\ *$//;
      } elsif(@lines[$j] !~ /^el/) {
        @lines[$j] = "";
      } else {
        last;
      }
    }
  }
}

truncate($fh,0);
seek($fh,0,0);
for ($i=0; $i<scalar @lines;++$i) {
  print $fh @lines[$i]."\n";
}
close $fh;
