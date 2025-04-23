module Lesson17 where
import Data.List
import Data.Semigroup

-- 使用函数组合创建函数的示例
myLast :: [a] -> a
myLast = head . reverse
myMin ::Ord a => [a] -> a
myMin = head . sort


myMax ::Ord a => [a] -> a
myMax = myLast . sort

myAll :: (a -> Bool) -> [a] -> Bool
myAll testFunc = (foldr (&&) True) . (map testFunc)

-- 使用Semigroup 组合相似类型
instance Semigroup Integer where
    (<>) x y = x + y
-- (<>) :: Semigroup a => a -> a -> a

{- main :: IO ()
main = do
    let num1 = 5
    let num2 = 10
    let combined = num1 <> num2
    print combined -- 输出 15 -}

-- Defining the Color type
data Color = Red 
    | Yellow
    | Blue
    | Green
    | Purple
    | Orange 
    | Brown deriving (Show, Eq)

-- 为我们的Color实现Semigroup类型
{- instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Yellow Red = Orange
    (<>) Red Yellow = Orange
    (<>) a b = if a == b
               then a
               else Brown -}

-- 重写 Color 的 Semigroup 实例
instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Yellow Red = Orange
    (<>) Red Yellow = Orange
    (<>) a b | a == b = a
             | all (`elem` [Red, Blue, Purple]) [a, b] = Purple
             | all (`elem` [Blue, Yellow, Green]) [a, b] = Green
             | all (`elem` [Red, Yellow, Orange]) [a, b] = Orange
             | otherwise = Brown