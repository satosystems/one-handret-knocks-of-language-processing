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

# 13. col1.txtとcol2.txtをマージ
# 12で作ったcol1.txtとcol2.txtを結合し，元のファイルの1列目と2列目をタブ区切りで並べたテキストファイルを作成せよ．確認にはpasteコマンドを用いよ．
paste col1.txt col2.txt > col12.txt
cat col12.txt
printSeparator

# 14. 先頭からN行を出力
# 自然数Nをコマンドライン引数などの手段で受け取り，入力のうち先頭のN行だけを表示せよ．確認にはheadコマンドを用いよ．
head -n 5 hightemp.txt
printSeparator

# 15. 末尾のN行を出力
# 自然数Nをコマンドライン引数などの手段で受け取り，入力のうち末尾のN行だけを表示せよ．確認にはtailコマンドを用いよ．
tail -n 5 hightemp.txt
printSeparator

