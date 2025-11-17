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

-- 查找字符在字母表中的索引位置
indexOf :: Char -> [Char] -> Int
indexOf ch [] = undefined
indexOf ch (x:xs) = if x == ch then 0 else 1 + indexOf ch xs
-- 定义了针对任意字母表的通用旋转函数
alphabetRot :: Alphabet -> Int -> Char -> Char
alphabetRot alphabet n ch =
  alphabet !! ((indexOf ch alphabet + n) `mod` length alphabet)

-- 定义小写字母旋转函数
upperRot :: Int -> Char -> Char
upperRot n ch = alphabetRot upperAlphabet n ch

lowerRot :: Int -> Char -> Char
lowerRot n ch = alphabetRot lowerAlphabet n ch