#extract graphic characters

wget http://www.unicode.org/Public/6.0.0/ucd/UnicodeData.txt
#gawk -F ';' '{ print $3; }' UnicodeData.txt | sort | uniq 
 
gawk -F ';' '$3!~/^(C|Z[lp])/ { printf("%d\n", strtonum("0x" $1)); } END {\
for (i = 0x3400; i < 0x4db5 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.A\
for (i = 0x4e00; i < 0x9fcb - 1; ++i) { printf("%d\n", i + 1); } #CJK\
for (i = 0xac00; i < 0xd7a3 - 1; ++i) { printf("%d\n", i + 1); } #Hangul\
for (i = 0x20000; i < 0x2a6d6 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.B\
for (i = 0x2a700; i < 0x2b734 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.C\
for (i = 0x2b740; i < 0x2b81d - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.D\
}' UnicodeData.txt |\
sort -n | gawk '{ printf("%d &#x%x;<br />\n", $1, $1); }' > chars6.0.html
 
wc -l chars6.0.html
#109242



#generate HTML

#gawk 'BEGIN { i = 0; w = 32; t = 40; f = 16; printf("<!DOCTYPE html>\n<html><head>\
#gawk 'BEGIN { i = 0; w = 32; t = 40; f = 4; printf("<!DOCTYPE html>\n<html><head>\
gawk 'BEGIN { i = 0; w = 331; t = 40; f = 16; printf("<!DOCTYPE html>\n<html><head>\
<meta charset=\"utf-8\" />\
<style>\
table { table-layout: fixed; width: %dpx; border-collapse:collapse; }\
td { width: %dpx; height: %dpx; overflow: hidden; line-height: 0px; border:solid black 1px; }\
* { text-align: center; margin: 0px; padding: 0px; font-family: HanaMinA, HiraMinB; font-size: %dpt; }\
caption { font-family: \"Palatino Linotype\"; }\
</style><title>Unicode 6.0 Graphic Characters</title></head>\
<body><table><tr>", w * t, t, t, f); }\
{ if (i != 0 && i % w == 0) printf("</tr><tr>");\
printf("<td id=\"u+%x\"><span>&#x%x;</span></td>", $1, $1); ++i; }\
END { while (i % w != 0) { printf("<td></td>"); ++i; }\
print "</tr></table>\
<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\
<script src=\"../font-check.js\"></script>\
</body></html>"; }' \
chars6.0.html > unicode6.0.html
