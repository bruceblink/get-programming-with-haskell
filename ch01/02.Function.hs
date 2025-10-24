module Function where

add :: Int -> Int -> Int
add x y = x + y
multiply :: Int -> Int -> Int
multiply x y = x * y

makeGreeting salutation person = salutation <> ", " <> person <> "!"
-- --- IGNORE ---       
-- 以上代码定义了两个函数 add 和 multiply，分别用于加法和乘法运算。
-- --- IGNORE ---
main = print (add 3 5, multiply 4 6)  -- (8, 24)