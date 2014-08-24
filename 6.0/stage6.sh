gawk 'BEGIN { i = 0; w = 331; t = 40; printf("<!DOCTYPE html>\n<html><head>\
<meta charset=\"utf-8\" />\
<style>\
* { margin:0px; padding:0px; }\
table { table-layout:fixed; width:%dpx; border-collapse:collapse; }\
td { text-align:center; vertical-align:middle; border:solid white 1px; width:%dpx; height:%dpx; }\
div { font-family:\"Everson Mono\", \"Segoe UI Symbol\", HanaMinA, HiraMinB; display:inline-block; }\
</style><title>Lena</title></head>\
<body><table><tr>", w * t + 1, t - 1, t - 1); }\
{ if (i != 0 && i % w == 0) printf("</tr><tr>");\
printf("<td id=\"u+%x\"><div style=\"font-size:%dpx\">&#x%x;</div></td>\n", $1, $2, $1); ++i; }\
END { while (i % w != 0) { printf("<td></td>\n"); ++i; }\
print "</tr></table>\
</body></html>"; }' \
lena.dat > lena.html
