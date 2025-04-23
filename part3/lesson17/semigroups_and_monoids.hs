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


