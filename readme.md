# vernam

## Description
This is a simple script which implements a Vernam cipher (one-time pad technique). To use it you should firstly generate a file filled with a random data which will be used as a key. The size of this file should be greater or equal to a size of input file you're going to encode. So the ending of a greater file will be ignored.
I'd like to use a special cryptographic tools to generate a proper pseudo-random sequence.

## How to use
Usage is quite simple:

    vernam.pl <file1> <file2>

Example:

    vernam.pl docs/credit_cards_pin_codes.zip key.bin > docs/credit_cards_pin_codes_ciphered.zip

## License

Copyright (c) 2014, Vitaliy Krutko

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
