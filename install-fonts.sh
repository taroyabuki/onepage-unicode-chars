#fonts installation

##Ubuntu

```
sudo apt-get install ^fonts-*

mkdir ~/.fonts

wget http://www.google.com/get/noto/pkgs/Noto-hinted.zip
unzip Noto-hinted.zip -x LICENSE -d ~/.fonts/

wget "http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fhanazono-font%2F60001%2Fhanazono-20131208.zip" -O hanazono.zip
unzip hanazono.zip *.ttf -d ~/.fonts/

fc-cache -fv
```

##Windows
###Unicode 5.0 on Windows

```
wget https://collab.itc.virginia.edu/access/content/group/26a34146-33a6-48ce-001e-f16ce7908a6a/Tibetan%20fonts/Tibetan%20Unicode%20Fonts/Jomolhari-alpha003.zip
```

###Unicode 6.0 on Windows

```
wget http://ftp.gnu.org/gnu/freefont/freefont-ttf-20120503.zip

wget http://unifoundry.com/pub/unifont-7.0.03/font-builds/unifont-7.0.03.ttf

wget http://users.teilar.gr/~g1951d/Symbola.zip
```