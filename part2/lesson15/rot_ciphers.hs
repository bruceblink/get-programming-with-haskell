{-# LANGUAGE BlockArguments #-}
module Lesson15 where
import GHC.Internal.Text.Read (Lexeme(Char))
import Language.Haskell.TH (fromE)
import Data.Array (indices)
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

-- 3字母字母表的消息和编码器
data ThreeLetterAlphabet = Alpha | Beta | Kappa deriving (Show, Enum, Bounded)
threeLetterMessage :: [ThreeLetterAlphabet]
threeLetterMessage = [Alpha,Alpha,Beta,Alpha,Kappa]
threeLetterEncoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterEncoder vals = map rot3l vals
  where alphaSize = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)
        rot3l = rotN alphaSize

fourLetterMessage :: [FourLetterAlphabet]
fourLetterMessage = [L1, L3, L4, L1, L1, L2]

-- 一个适用于奇数个字母的 rotN 解码器
rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a 
rotNdecoder n c = toEnum rotation 
  where halfN = n `div` 2
        offset = if even n
                then fromEnum c + halfN
                else 1 + fromEnum c + halfN
        rotation = offset `mod` n

--一个适用于 ThreeLetterAlphabet的有效解码器
threeLetterDecoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterDecoder vals = map rot3ldecoder vals
  where alphaSzie = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)
        rot3ldecoder = rotNdecoder alphaSzie


-- 使用 `rotEncoder` 和 `rotDecoder` 旋转字符串
rotEncoder :: String -> String
rotEncoder text = map rotChar text  -- 旋转字符串中的所有字符

rotDecoder :: String -> String
rotDecoder text = map rotChar text
  where alphaSize = 1 + fromEnum (maxBound :: Char)
        rotChar = rotN alphaSize


-- 定义 xor 函数
xorBool :: Bool -> Bool -> Bool
xorBool value1 value2 = (value1 || value2) && (not (value1 && value2))
-- 最简洁的方式是 value1 /= value2 

-- xorPair to xor pairs of Bools
xorPair :: (Bool, Bool) -> Bool
xorPair (v1, v2) = xorBool v1 v2

-- xor的最终版
xor :: [Bool] -> [Bool] -> [Bool]
xor list1 list2 = map xorPair (zip list1 list2)  -- 注意这里zip的用法,不熟悉的可以去查一下相关文档

-- convert an Int type to Bits
-- Define the type alias (optional, you can use [Bool] directly)
type Bits = [Bool]

-- This is the function definition line
intToBits' :: Int -> Bits
-- This is the start of the equation body, with guards indented
intToBits' 0 = [False]
intToBits' 1 = [True]
intToBits' n = if (remainder == 0)
               then False : intToBits' nextVal
               else True : intToBits' nextVal
  where remainder = n `mod` 2
        nextVal = n `div` 2   
-- `maxBits` 和你的最终 `intToBits` 函数
maxBits :: Int
maxBits = length (intToBits' maxBound)
intToBits :: Int -> Bits
intToBits n = leadingFalses ++ reverseBits
    where reverseBits = reverse (intToBits' n)
          missingBits = maxBits - (length reverseBits)
          leadingFalses = take missingBits (cycle [False])

-- 实现 chatToBits 将char 转换成Bits
charToBits :: Char -> Bits
charToBits char = intToBits (fromEnum char)

-- 将bit位转换为数字int
bitsToInt :: Bits -> Int
bitsToInt bits = sum (map (\x -> 2^(snd x)) trueLocations)
    where size = length bits
          indices = [size-1, size -2 ..0]
          trueLocations = filter (\x -> fst x == True)
                          (zip bits indices)

-- 通过从 `toEnum` 返回来完成bitsToChar转换。
bitsToChar :: Bits -> Char
bitsToChar bits = toEnum (bitsToInt bits)

-- 简单密码本
myPad :: String
myPad = "Shhhhhh"

-- 明文
myPlainText :: String
myPlainText = "Haskell"

-- applyOTP' 用于使用一次性密码本将字符串转换为比特
applyOTP' :: String -> String -> [Bits]
applyOTP' pad plaintext = map (\pair -> 
                                (fst pair) `xor` (snd pair))
                          (zip padBits plaintextBits)
  where padBits = map charToBits pad
        plaintextBits = map charToBits plaintext

-- 最后，应用 `applyOTP` 使用一次性密码本编码字符串。
applyOTP :: String -> String -> String
applyOTP pad plaintext = map bitsToChar bitList
    where bitList = applyOTP' pad plaintext

-- 使用部分函数创建编码/解码器
encoderDecoder :: String -> String
encoderDecoder = applyOTP myPad

-- 创建密码（Cipher）类
class Cipher a where
    encode :: a -> String -> String
    decode :: a -> String -> String

-- 定义 Rot类型
data Rot = Rot

-- Rot 实现 Cipher
instance Cipher Rot where
    encode Rot text = rotEncoder text
    decode Rot text = rotDecoder text

-- 定义密码本类型
data OneTimePad = OTP String

-- oneTimePad 实现 Cipher
instance Cipher OneTimePad where
    encode (OTP pad) text = applyOTP pad text
    decode (OTP pad) text = applyOTP pad text

myOTP :: OneTimePad
myOTP = OTP (cycle [minBound .. maxBound])