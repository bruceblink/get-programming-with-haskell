module Main where
import System.Environment
import GHC.Internal.Control.Monad (replicateM)
-- 非惰性求值的 命令行交互
main :: IO ()
main = do
  args <- getArgs
  let linesToRead = if length args > 0
                    then read (head args)
                    else 0::Int 
  numbers <- replicateM linesToRead getLine
  let ints = map read numbers :: [Int]
  print (sum ints)