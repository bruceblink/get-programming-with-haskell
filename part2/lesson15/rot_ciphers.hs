module Lesson15 where
import GHC.Internal.Text.Read (Lexeme(Char))
--  定义四字母的字母表
data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)

-- 可以工作在所有字符表上的通用的ortN函数
rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize c = toEnum rotation
  where halfAlphabet = alphabetSize `div` 2
        offset = fromEnum c + halfAlphabet
        rotation = offset `mod` alphabetSize

-- 获取表示最大 Char 的数字
largestCharNumber :: Int
largestCharNumber = fromEnum (maxBound :: Char)  -- 这里必须指定Char类型,
                                    -- 这样maxBound才能知道你使用的是什么类型

-- 旋转单个Char
rotChar :: Char -> Char
rotChar charToEncrpy = rotN sizeOfAlpabet charToEncrpy
  where sizeOfAlpabet = 1 + fromEnum (maxBound :: Char)

-- 一个在你四字母字母表里的消息
message :: [FourLetterAlphabet]
message = [L1, L3, L4, L1, L1, L2]

-- 使用map定义消息编码器
fourLetterAlphabetEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterAlphabetEncoder vals = map rot4l vals
  where alphaSize = 1 + fromEnum (maxBound :: FourLetterAlphabet)
        rot4l = rotN alphaSize


