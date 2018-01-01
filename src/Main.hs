printSeparator :: IO ()
printSeparator = putStrLn "--------------------"

main :: IO ()
main = do
  a00

-- 00. 文字列の逆順
-- 文字列"stressed"の文字を逆に（末尾から先頭に向かって）並べた文字列を得よ．
a00 :: IO ()
a00 = do
  putStrLn $ reverse "stressed"
  printSeparator

