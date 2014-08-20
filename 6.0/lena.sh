gawk 'BEGIN { i = 0; w = 331; t = 40; f = 16; printf("<!DOCTYPE html>\n<html><head>\
<meta charset=\"utf-8\" />\
<style>\
table { table-layout: fixed; width: %dpx; border:solid black 1px; }\
td { width: %dpx; height: %dpx; overflow: hidden; line-height: 0px; }\
* { text-align: center; margin: 0px; padding: 0px; font-family: HanaMinA, HiraMinB; font-size: %dpt; }\
caption { font-family: \"Palatino Linotype\"; }\
</style><title>Lena</title></head>\
<body><table><tr>", w * t, t, t, f); }\
{ if (i != 0 && i % w == 0) printf("</tr><tr>");\
printf("<td id=\"u+%x\"><span>&#x%x;</span></td>", $1, $1); ++i; }\
END { while (i % w != 0) { printf("<td></td>"); ++i; }\
print "</tr></table>\
<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js\"></script>\
<script src=\"../font-check.js\"></script>\
</body></html>"; }' \
lena.dat > lena.html
