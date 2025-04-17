module Lesson11 where
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

-- 元组
-- 相同类型
ageAndHeight :: (Int, Int)
ageAndHeight = (34, 34)

-- 不同类型
firstLastMiddle :: (String, String, Char)
firstLastMiddle = ("Oscar", "Grouch", 'D')

streetAddress :: (Int, String)
streetAddress = (123, "Happy St.")

