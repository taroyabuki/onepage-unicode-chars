#extract graphic characters

wget http://www.unicode.org/Public/7.0.0/ucd/UnicodeData.txt
#gawk -F ';' '{ print $3; }' UnicodeData.txt | sort | uniq 
 
gawk -F ';' '$3!~/^(C|Z[lp])/ { printf("%d\n", strtonum("0x" $1)); } END {\
for (i = 0x3400; i < 0x4db5 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.A\
for (i = 0x4e00; i < 0x9fcc - 1; ++i) { printf("%d\n", i + 1); } #CJK\
for (i = 0xac00; i < 0xd7a3 - 1; ++i) { printf("%d\n", i + 1); } #Hangul\
for (i = 0x20000; i < 0x2a6d6 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.B\
for (i = 0x2a700; i < 0x2b734 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.C\
for (i = 0x2b740; i < 0x2b81d - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.D\
}' UnicodeData.txt |\
sort -n | gawk '{ printf("%d &#x%x;<br />\n", $1, $1); }' > characters.html
 
wc -l characters.html
#112804
