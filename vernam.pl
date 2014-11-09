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
my $filename3;
my $file3 = STDOUT;


sub misusage {
    say STDERR "usage: ${0} [-o <file3>] <file1> <file2>";
    exit(1);
}


if ($argc == 2 || $argc == 4) {
    for (my $arg = shift(); defined($arg); $arg = shift()) {
        if ($arg eq "-o") {
            $arg = shift();
            if (defined($arg)) {
                $filename3 = $arg;
                open($file3, '>', $filename3) or die("Could not open file `$filename3`");
            } else {
                misusage();
            }
        } else {
            if (!defined($filename1)) {
                $filename1 = $arg;
                open($file1, '<', $filename1) or die("Could not open file `$filename1`");
            } elsif (!defined($filename2)) {
                $filename2 = $arg;
                open($file2, '<', $filename2) or die("Could not open file `$filename2`");
            } else {
                misusage();
            }
        }
    }
} else {
    misusage();
}

binmode($file1, ":raw");
binmode($file2, ":raw");
binmode($file3, ":raw");

for (;;) {
    my $c1 = getc($file1);
    my $c2 = getc($file2);
    if (defined($c1) and defined($c2)) {
        print $file3 ($c1 ^ $c2);
    } else {
        last;
    }
}
