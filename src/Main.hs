import Data.Char (isAlpha)

printSeparator :: IO ()
printSeparator = putStrLn "--------------------"

main :: IO ()
main = do
  a00
  a01
  a02
  a03

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

