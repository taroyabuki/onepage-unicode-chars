#extract graphic characters

wget http://www.unicode.org/Public/5.2.0/ucdxml/ucd.all.flat.zip

unzip -p ucd.all.flat.zip | python3 ../parse.py > characters.html

wc -l characters.html
#107154
