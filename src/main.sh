#!/bin/bash

printSeparator() {
  echo --------------------
}

# 10. 行数のカウント
# 行数をカウントせよ．確認にはwcコマンドを用いよ．
wc hightemp.txt | awk '{print $1}'
printSeparator

# 11. タブをスペースに置換
# タブ1文字につきスペース1文字に置換せよ．確認にはsedコマンド，trコマンド，もしくはexpandコマンドを用いよ．
cat hightemp.txt | tr "\t" " "
printSeparator

# 12. 1列目をcol1.txtに，2列目をcol2.txtに保存
# 各行の1列目だけを抜き出したものをcol1.txtに，2列目だけを抜き出したものをcol2.txtとしてファイルに保存せよ．確認にはcutコマンドを用いよ．
cut -f1 hightemp.txt > col1.txt
cut -f2 hightemp.txt > col2.txt
cat col1.txt
echo ----
cat col2.txt
printSeparator

