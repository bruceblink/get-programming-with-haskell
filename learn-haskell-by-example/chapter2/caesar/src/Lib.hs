module Lib          --1 定义模块名
    ( square        --2 指定导出列表
    ) where

square :: Int -> Int   --3 给出类型签名
square x = x * x       --4 提供函数定义
