# All Unicode 6.0 Graphic Characters in one page

http://blog.unfindable.net/archives/7740

## 作るもの
* `unicode.pdf`: Unicode 6.0 Graphic Charactersを並べたもの
* `lena.pdf`: Lenaの画像（グレースケール）の濃淡にあわせてUnicode 6.0 Graphic Charactersを並べたもの。Lenaの画像は本来512px x 512pxだが、Unicode 6.0 Graphic Charactersは109242個しかないため、331px x 331pxにリサイズして、その各ピクセルに文字を割り当てている。足りない109561 (= 331 x 331) - 109242 = 319個の分はU+0020（半角スペース）を使っている。

## 手順
（後で書く）

### 印刷方法
Firefox on Windowsで印刷する。

* Page Size: 120cm x 120cm
* top margin: 19mm
* left margin: 19mm
* right margin: 0mm
* bottom margin: 0mm

## 課題

サイズを正しく取れず、枠にうまく納められない文字がある。

* U+0dda（Iskoola Pota）
* U+a9bcのあたり（Noto Sans Javanese）
