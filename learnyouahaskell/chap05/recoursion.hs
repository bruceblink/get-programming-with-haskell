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
