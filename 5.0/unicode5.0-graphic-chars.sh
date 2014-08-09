#install fonts
sudo apt-get install ^fonts-*

mkdir ~/.fonts

wget http://www.google.com/get/noto/pkgs/Noto-hinted.zip
unzip Noto-hinted.zip -x LICENSE -d ~/.fonts/

wget "http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fhanazono-font%2F60001%2Fhanazono-20131208.zip" -O hanazono.zip
unzip hanazono.zip *.ttf -d ~/.fonts/

fc-cache -fv


#extract graphic characters
wget http://www.unicode.org/Public/5.0.0/ucd/UnicodeData.txt
#gawk -F ';' '{ print $3; }' UnicodeData.txt | sort | uniq 

gawk -F ';' '$3!~/^(C|Z[lp])/ { printf("%d\n", strtonum("0x" $1)); } END {\
for (i = 0x3400; i < 0x4db5 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.A\
for (i = 0x4e00; i < 0x9fbb - 1; ++i) { printf("%d\n", i + 1); } #CJK\
for (i = 0xac00; i < 0xd7a3 - 1; ++i) { printf("%d\n", i + 1); } #Hangul\
for (i = 0x20000; i < 0x2a6d6 - 1; ++i) { printf("%d\n", i + 1); } #CJK Ext.B\
}' UnicodeData.txt |\
sort -n | gawk '{ printf("%d &#x%x;<br />\n", $1, $1); }' > chars5.0.html

wc -l chars5.0.html
#98884


#generate HTML

#gawk 'BEGIN { i = 0; w = 25; t = 40; f = 20; printf("<!DOCTYPE html>\n<html><head>\
gawk 'BEGIN { i = 0; w = 384 - 1; t = 40; f = 20; printf("<!DOCTYPE html>\n<html><head>\
<meta charset=\"utf-8\" />\
<style>\
table { table-layout: fixed; width: %dpx; }\
td { width: %dpx; height: %dpx; overflow: hidden; line-height: 0px;}\
* { text-align: center; margin: 0px; padding: 0px; font-family: HanaMinA, HiraMinB; font-size: %dpt; }\
</style><title>Unicode 5.0 Graphic Characters</title></head>\
<body><table><tr>", (w + 1) * t, t, t, f); }\
{ if (i != 0 && i % w == 0) printf("</tr><tr>");\
printf("<td id=\"u+%x\"><span>&#x%x;</span></td>", $1, $1); ++i; }\
END { while (i % w != 0) { printf("<td></td>"); ++i; }\
print "</tr></table>\
<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\
<script src=\"unicode5.0-font-check.js\"></script>\
</body></html>"; }' \
chars5.0.html > unicode.html
