#!/usr/bin/perl
#
# Copyright (c) 2014, Vitaliy Krutko, asmxforce@gmail.com
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy of  this
# software and associated documentation files (the "Software"), to deal in the  Software
# without restriction, including without limitation the  rights  to  use,  copy,  modify,
# merge, publish, distribute, sublicense, and/or sell copies of  the  Software,  and  to
# permit persons to whom the Software is furnished to do so, subject  to  the  following
# conditions:
#
#  The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.
#
#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS  OR  IMPLIED,
# INCLUDING  BUT  NOT  LIMITED  TO  THE WARRANTIES  OF  MERCHANTABILITY,   FITNESS   FOR
# A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS  OR  COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN  ACTION  OF
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH  THE  SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

use 5.010;

my $argc = @ARGV;
my $filename1;
my $file1;
my $filename2;
my $file2;


sub misusage {
    say "usage: ${0} <file1> <file2>";
    exit(1);
}


if ($argc == 2) {
    $filename1 = shift;
    open($file1, $filename1) or die("Could not open file `$filename1`");
    $filename2 = shift;
    open($file2, $filename2) or die("Could not open file `$filename2`");
} else {
    misusage();
}

binmode($file1, ":raw");
binmode($file2, ":raw");
binmode(STDOUT, ":raw");

for (;;) {
    my $c1 = getc($file1);
    my $c2 = getc($file2);
    if (defined($c1) and defined($c2)) {
        print ($c1 ^ $c2);
    } else {
        last;
    }
}
