import Data.Char (isAlpha)

printSeparator :: IO ()
printSeparator = putStrLn "--------------------"

biGram :: [a] -> [[a]] -> [[a]]
biGram [] rs = reverse rs
biGram (w1:w2:ws) rs = biGram (w2:ws) ([w1, w2]:rs)
biGram (_:_) rs = biGram [] rs

main :: IO ()
main = do
  a00
  a01
  a02
  a03
  a04
  a05

-- 00. 文字列の逆順
-- 文字列"stressed"の文字を逆に（末尾から先頭に向かって）並べた文字列を得よ．
a00 :: IO ()
a00 = do
  putStrLn $ reverse "stressed"
  printSeparator

-- 01. 「パタトクカシーー」
-- 「パタトクカシーー」という文字列の1,3,5,7文字目を取り出して連結した文字列を得よ．
a01 :: IO ()
a01 = do
  putStrLn $ foldr (fn "パタトクカシーー") "" [1, 3, 5, 7]
  printSeparator
 where
  fn s n r = s !! n:r

-- 02. 「パトカー」＋「タクシー」＝「パタトクカシーー」
-- 「パトカー」＋「タクシー」の文字を先頭から交互に連結して文字列「パタトクカシーー」を得よ．
a02 :: IO ()
a02 = do
  putStrLn . concat $ map (\(a, b) -> a:[b]) $ zip "パトカー" "タクシー"
  printSeparator

-- 03. 円周率
-- "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."という文を単語に分解し，各単語の（アルファベットの）文字数を先頭から出現順に並べたリストを作成せよ．
a03 :: IO ()
a03 = do
  print $ map (length . filter isAlpha) $ words "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
  printSeparator

-- 04. 元素記号
-- "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."という文を単語に分解し，1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，それ以外の単語は先頭に2文字を取り出し，取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ．
a04 :: IO ()
a04 = do
  print $ fn [1, 5, 6, 7, 8, 9, 15, 16, 19] 1 (words "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.") []
  printSeparator
 where
  fn _ _ [] rs = reverse rs
  fn ns n (w:ws) rs = fn ns (n + 1) ws ((n, (take len w)):rs)
   where
    len = if n `elem` ns then 1 else 2

-- 05. n-gram
-- 与えられたシーケンス（文字列やリストなど）からn-gramを作る関数を作成せよ．この関数を用い，"I am an NLPer"という文から単語bi-gram，文字bi-gramを得よ．
a05 :: IO ()
a05 = do
  let text = "I am an NLPer"
  print $ biGram (words text) []
  print $ biGram text []
  printSeparator

