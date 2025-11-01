module PatternMatch where
-- 定义一个递归函数，计算列表中所有元素的和
sumList (x:xs) = x + sumList xs
sumList [] = 0
-- 使用 sumList 函数计算列表的和
sumResult = sumList [1,2,3,4]  -- 10
-- 等价于
-- sumResult = 1 + sumList [2,3,4]
-- -- 等价于
-- sumResult = 1 + (2 + sumList [3,4])
-- -- 等价于
-- sumResult = 1 + (2 + (3 + sumList [4]))
-- -- 等价于
-- sumResult = 1 + (2 + (3 + (4 + sumList [])))
-- -- 等价于
-- sumResult = 1 + (2 + (3 + (4 + 0)))
-- -- 最终结果
-- sumResultFinal = 10
-- 定义一个函数，使用模式匹配提取元组中的元素
firstElement (x, _) = x
secondElement (_, y) = y
-- 使用 firstElement 和 secondElement 函数提取元组元素
first = firstElement (1, "Hello")  -- 1
second = secondElement (1, "Hello")  -- "Hello"