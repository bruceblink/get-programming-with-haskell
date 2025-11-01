module Main (main) where

import Lib   --1 导入模块

main :: IO ()  --2 定义主操作
main =  putStrLn ("Square of 5 is " ++ show (square 5))  --3 使用导入的函数
