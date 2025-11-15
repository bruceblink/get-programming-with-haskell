module Lib          --1 定义模块名
    (         --2 指定导出列表
    ) where

type Alphabet = [Char] -- 定义字母表类型

lowerAlphabet :: Alphabet
lowerAlphabet = ['a' .. 'z']

upperAlphabet :: Alphabet
upperAlphabet = ['A' .. 'Z']

digits :: Alphabet
digits = ['0' .. '9']