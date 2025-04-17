module Lesson11 where
import Distribution.Compat.CharParsing (letter)
x :: Int
x = 2

y :: Integer
y = 2

--- 通用类型 Char Double 和 Bool
letter :: Char
letter = 'a'

interesRate :: Double
interesRate = 0.375

isFun :: Bool
isFun = True

-- List类型
values :: [Int]
values = [1, 2, 3]

testScores :: [Double]
testScores = [0.99, 0.7, 0.8]

letters :: [Char]
letters = ['a', 'b', 'c']

-- String和Char List

aPet :: [Char]
aPet = "cat"

anotherPet :: String
anotherPet = "dog"