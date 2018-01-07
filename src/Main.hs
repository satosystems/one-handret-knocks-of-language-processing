import Data.Char ( chr
                 , isAlpha
                 , isLower
                 , ord
                 )
import Data.List ( (\\)
                 , intersect
                 , intersperse
                 , union
                 )
import Data.List.Unique (sortUniq)
import System.Random ( getStdRandom
                     , randomR
                     )

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
  a06
  a07
  a08
  a09
  a10
  a11

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

-- 06. 集合
-- "paraparaparadise"と"paragraph"に含まれる文字bi-gramの集合を，それぞれ, XとYとして求め，XとYの和集合，積集合，差集合を求めよ．さらに，'se'というbi-gramがXおよびYに含まれるかどうかを調べよ．
a06 :: IO ()
a06 = do
  let x = biGram "paraparaparadise" []
      y = biGram "paragraph" []
  print $ sortUniq $ x `union` y
  print $ sortUniq $ x `intersect` y
  print $ sortUniq $ x \\ y
  putStrLn $ "x includes \"se\": " ++ show ("se" `elem` x)
  putStrLn $ "y includes \"se\": " ++ show ("se" `elem` y)
  printSeparator

-- 07. テンプレートによる文生成
-- 引数x, y, zを受け取り「x時のyはz」という文字列を返す関数を実装せよ．さらに，x=12, y="気温", z=22.4として，実行結果を確認せよ．
a07 :: IO ()
a07 = do
  putStrLn $ fn 12 "気温" 22.4
  printSeparator
 where
  fn x y z = show x ++ "時の" ++ y ++ "は" ++ show z

-- 08. 暗号文
-- 与えられた文字列の各文字を，以下の仕様で変換する関数cipherを実装せよ．
--   * 英小文字ならば(219 - 文字コード)の文字に置換
--   * その他の文字はそのまま出力
-- この関数を用い，英語のメッセージを暗号化・復号化せよ．
a08 :: IO ()
a08 = do
  let encrypted = cipher "I frame no hypotheses." ""
      decrypted = cipher encrypted ""
  putStrLn encrypted
  putStrLn decrypted
  printSeparator
 where
  cipher [] r = reverse r
  cipher (c:cs) r | isLower c = cipher cs $ chr (219 - ord c):r
                  | otherwise = cipher cs $ c:r

-- 09. Typoglycemia
-- スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．ただし，長さが４以下の単語は並び替えないこととする．適当な英語の文（例えば"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."）を与え，その実行結果を確認せよ．
a09 :: IO ()
a09 = do
  putStrLn =<< fn "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."
  printSeparator
 where
  fn s = fn' (words s) []
  fn' [] r = return $ concat $ intersperse " " $ reverse r
  fn' (w:ws) r | length w <= 4 = fn' ws $ w:r
               | otherwise = do
                 let h = head w
                     l = last w
                     body = tail $ init w
                 shuffled <- shuffle body ""
                 fn' ws $ (h:shuffled ++ [l]):r
   where
    shuffle [] r = return r
    shuffle a r = do
      i <- getStdRandom (randomR (0, (length a) - 1))
      let e = a !! i
          (f, s) = splitAt i a
          rest = f ++ tail s
      shuffle rest $ e:r

-- 10. 行数のカウント
-- 行数をカウントせよ．確認にはwcコマンドを用いよ．
a10 :: IO ()
a10 = do
  contents <- readFile "hightemp.txt"
  print $ length $ lines contents
  printSeparator

-- 11. タブをスペースに置換
-- タブ1文字につきスペース1文字に置換せよ．確認にはsedコマンド，trコマンド，もしくはexpandコマンドを用いよ．
a11 :: IO ()
a11 = do
  contents <- readFile "hightemp.txt"
  putStr $ map (\c -> if c == '\t' then ' ' else c) contents
  printSeparator

