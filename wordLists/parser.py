# -*- coding: utf-8 -*-
import re

# import text

text = """
A .txt file
"""

# print basics

print("""
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>""");


# get all instances of each word in plist

matches = re.findall("(.*)", text);

# print matches

for match in matches:
    if match != "":
        print("    <string>" + match + "</string>");

# print all instance as new row

print("""</array>
</plist>
""");
