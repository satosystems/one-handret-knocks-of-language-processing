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

