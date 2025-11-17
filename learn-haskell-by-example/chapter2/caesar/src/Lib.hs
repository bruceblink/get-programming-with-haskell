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

-- 定义通用字符旋转函数
rotChar :: Int -> Char -> Char
rotChar n ch
  | isLower ch = lowerRot n ch      -- #1 小写字母则转换
  | isUpper ch = upperRot n ch      -- #2 大写字母则抓换
  | otherwise  = ch                 -- #3 其他字符不变


isLower :: Char -> Bool
isLower char = char `elem` lowerAlphabet   -- 判断字符是否在小写字母表中

isUpper :: Char -> Bool
isUpper char = char `elem` upperAlphabet   -- 判断字符是否在大写字母表中 

isDigit :: Char -> Bool
isDigit char = char `elem` digits    -- 判断字符是否为数字