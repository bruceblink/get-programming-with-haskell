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


