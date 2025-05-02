import System.IO
main :: IO ()
main = do
  helloFile <- openFile "hello.txt" ReadMode
  firstLine <- hGetLine helloFile
  putStrLn firstLine
  secondLine <- hGetLine helloFile
  goodbyeFile <- openFile "goodbye.txt" WriteMode
  hPutStrLn goodbyeFile secondLine
  hClose helloFile
  hClose goodbyeFile
  putStrLn "done!"

  -- 从hello.txt 读取第一行写入控制台，
  -- 然后从hello.txt读取第二行写入goodbye.txt