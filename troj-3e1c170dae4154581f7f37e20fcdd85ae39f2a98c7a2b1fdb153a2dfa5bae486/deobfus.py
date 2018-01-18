#!/usr/bin/env python

import urllib
import re

with open('scan_234724767987497437257751775751.js', 'r') as content_file:
    obfus_content = re.search(r'decodeURIComponent\(\'(.*)\'\)', content_file.read()).group(1)
    with open('intermediate_deobfus.js', 'w') as script:
        script.write(urllib.unquote(obfus_content))
