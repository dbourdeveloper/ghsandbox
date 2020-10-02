#!/usr/bin/python3
from fuzzywuzzy import fuzz
from fuzzywuzzy import process

print(fuzz.ratio('this is a test', 'this is a test!'))
