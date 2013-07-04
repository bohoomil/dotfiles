#!/usr/bin/perl -w
# dwb: gu
# usage [n]gu goes up n directories in the current directory hierarchy

my $uri = $ARGV[0];
my $n = $ARGV[2];
$uri =~ s/[^\/]*$//;
for (my $i = 0; $i<$n; $i++) {
  last if $uri =~ m/https?:\/\/[^\/]+\/$/;
  $uri =~ s/[^\/]+\/$//;
}
print "open $uri\n";
