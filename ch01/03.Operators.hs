module Operators where
-- 定义自定义的加法 +++ 操作符
(+++) a b = a + b 
-- 使用 +++ 操作符进行加法运算
-- 中缀调用
result = 1 +++ 2  -- 3
-- 前缀调用
result2 = (+++) 3 4  -- 7
increment = (+1)  -- 定义一个部分应用函数，固定加数为1
incrementedValue = increment 5  -- 6
increment2 = flip (+++) 2  -- 定义一个部分应用函数，固定加数为2
incrementedValue2 = increment2 10  -- 12
-- 定义自定义的连接操作符 <-> 用于字符串连接
(<->) a b = a <> " - " <> b
-- 指定 <-> 为中缀操作符，优先级为 5，结合性为左结合
infixl 5 <->
-- 使用 <-> 操作符进行字符串连接
greeting :: String
greeting = "Hello" <-> "World"  -- "Hello - World"