module Chap05 where

-- 实现自定义的 Maximum'
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

-- 用法示例： maximum' [10, 32, 1, 15, 62, 101]  -- 返回 101


-- 自定义take
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _ 
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

-- 用法示例： take' 2 [1,2,3,4,5]  -- 返回 [1, 2]

-- 自定义reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- 用法示例 reverse' [1,2,3,4,5] -- 返回 [5,4,3,2,1] 

-- 自定义的zip
zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y):zip' xs ys
-- 用法示例：zip' [1,2,3] [4,5,6]  -- 返回 [(1,4),(2,5),(3,6)]

-- 自定义elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = elem' a xs

-- 用法示例 elem' 3 [1,2,3,4,5]  -- 返回 True