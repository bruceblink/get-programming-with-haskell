module Main where
import System.Environment
-- 惰性求值的命令行交互
main :: IO ()
main = do
    userInput <- getContents
    let numbers = toInts userInput
    print (sum numbers)

toInts :: String -> [Int]
toInts = map read . lines
