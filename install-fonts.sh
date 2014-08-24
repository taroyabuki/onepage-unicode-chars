#fonts installation

##Ubuntu

Windowsの場合は、以下の作業の後で`~/.fonts/`にできるフォント群をインストールすればよい。

```
sudo apt-get install ^fonts-*

mkdir ~/.fonts

wget http://www.google.com/get/noto/pkgs/Noto-hinted.zip
unzip Noto-hinted.zip -x LICENSE -d ~/.fonts/

wget "http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fhanazono-font%2F60001%2Fhanazono-20131208.zip" -O hanazono.zip
unzip hanazono.zip *.ttf -d ~/.fonts/

wget https://collab.itc.virginia.edu/access/content/group/26a34146-33a6-48ce-001e-f16ce7908a6a/Tibetan%20fonts/Tibetan%20Unicode%20Fonts/Jomolhari-alpha003.zip
unzip Jomolhari-alpha003.zip *.ttf -d ~/.fonts/

wget http://ftp.gnu.org/gnu/freefont/freefont-ttf-20120503.zip
unzip freefont-ttf-20120503.zip *.ttf -d ~/.fonts/

wget http://users.teilar.gr/~g1951d/Symbola.zip
unzip Symbola.zip Symbola_hint.ttf -d ~/.fonts/

wget http://www.evertype.com/emono/evermono.zip
unzip -j evermono.zip "evermono-6.2.1/Everson Mono.ttf" -d fonts/

#wget http://www.svayambhava.org/siddhanta.ttf
#cp siddhanta.ttf ~/.fonts/

#wget http://unifoundry.com/pub/unifont-7.0.03/font-builds/unifont-7.0.03.ttf

#Notoはよくないが他もダメ
#rm ~/.fonts/NotoSansJavanese-Regular.ttf
#wget https://sites.google.com/site/jawaunicode/TuladhaJejegGr_2.01.zip
#unzip TuladhaJejegGr_2.01.zip *.ttf -d ~/.fonts/
#wget http://www.reocities.com/jglavy/fontsnstuff/Javanese.zip
#unzip Javanese.zip *.TTF -d ~/.fonts/
#wget https://sites.google.com/site/hanacarakan/font/Carakan-Anyar-Rev-01D.ttf
#cp Carakan-Anyar-Rev-01D.ttf ~/.fonts/

rm ~/.fonts/NotoSansBalinese-Regular.ttf
wget http://www.alanwood.net/downloads/aksrbali.zip
unzip -j aksrbali.zip aksrbali/*.ttf -d ~/.fonts/

rm ~/.fonts/NotoSansSumeroAkkadianCuneiform-Regular.ttf
wget http://users.teilar.gr/~g1951d/Akkadian.zip
unzip Akkadian.zip Akkadian_hint.ttf -d ~/.fonts/

rm ~/.fonts/NotoSansBuginese-Regular.ttf
wget https://sites.google.com/site/niariot87/SaweriV2.rar?attredirects=0
unrar e SaweriV2.rar swrnV2.ttf ~/.fonts/

fc-cache -fv
```
