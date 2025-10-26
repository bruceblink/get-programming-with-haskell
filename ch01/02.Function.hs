module Function where

add :: Int -> Int -> Int
add x y = x + y
multiply :: Int -> Int -> Int
multiply x y = x * y

makeGreeting salutation person = salutation <> ", " <> person <> "!"

-- 调用 makeGreeting
greeting = makeGreeting "Hello" "George" -- "Hello, George!"

-- 定义匿名函数 lambdaAdd
lambdaAdd = \x y -> x + y   
-- 调用 lambdaAdd
lambdaResult = lambdaAdd 2 3  -- 5  

-- 调用匿名函数
greetingLambda = \salutation person -> salutation <> ", " <> person <> "!"
greetingResult = greetingLambda "Hi" "Alice"  -- "Hi, Alice!"

-- 定义一个函数，返回一个三元组 以下三种写法等价
makeThruple a b c = (a,b,c)
lambdaThruple a b = \c -> (a,b,c)
lambdaThruple' = \a -> \b -> \c -> (a,b,c)
-- 调用 makeThruple 和 lambdaThruple
thruple1 = makeThruple 1 2 3          -- (1,2,3)
thruple2 = lambdaThruple 1 2 3        -- (1,2,3)
thruple3 = lambdaThruple' 1 2 3      -- (1,2,3)

-- 使用 partially applied functions(部分应用函数)
addFive = add 5          -- 部分应用函数，固定第一个参数为5
resultAddFive = addFive 10  -- 15

-- lambda 表达式的部分应用
multiplyByTwo = \x -> multiply 2 x  -- 部分应用函数，固定第一个参数为2
resultMultiplyByTwo = multiplyByTwo 8  -- 16
-- 另一个部分应用示例
greetPerson = \person -> makeGreeting "Hello" person  -- 部分应用函数，固定第一个参数为"Hello"
greetingForBob = greetPerson "Bob"  -- "Hello, Bob!"
-- 固定参数
enthusiasticGreet salutation person = makeGreeting (salutation <> "!") person
enthusiasticGreetingForEve = enthusiasticGreet "Hi" "Eve"  -- "Hi!, Eve!"

-- 中缀函数的部分应用
half = (/2)  -- 部分应用函数，固定除数为2
halfOfTen = half 10  -- 5.0
twice = (*2)  -- 部分应用函数，固定乘数为2
twiceOfSeven = twice 7  -- 14

-- 将普通函数转换为中缀函数
infixAdd x y = x `add` y  -- 使用中缀形式调用 add
infixAddResult = infixAdd 4 6  -- 10

greetBob = (`makeGreeting` "Bob")  -- "Hello, Bob!"
a = greetBob "Hello"  -- "Hello, Bob!"
b = greetBob "Hi"     -- "Hi, Bob!"

-- flip 函数的实用方法，可以仅应用函数的第二个参数
flipGreetBob = flip makeGreeting "Bob"
c = flipGreetBob "Hello"  -- "Bob, Hello!"

sayThree a b c = a <> ", " <> b <> ", " <> c <> "!"
sayThreeToABC = sayThree "Alice" "Bob" "Charlie" -- "Alice, Bob, Charlie!"

-- 使用 flip 调用 sayThree
flipSayThreeToCAB = flip sayThree "Alice" "Bob" "Charlie" -- "Charlie, Alice, Bob!"
-- 进一步翻转参数顺序 ,翻转第二个和第三个参数
sayThreeToACB = flip (sayThree "Alice") "Bob" "Charlie" -- "Alice, Charlie, Bob!"

-- 组合函数 Composing Functions
-- 首先定义基本函数
addOne num = num + 1
timesTwo num = num * 2
squared num = num * num
minusFive num = num - 5

-- 基本函数调用
result1 = addOne 1 -- 2
result2 = timesTwo result1 -- 4
result3 = squared result2 -- 16
-- 通过各个阶段的函数执行结果 计算最终结果
finalResult = minusFive result3 -- 11

-- 等价于下面的使用组合函数计算的方式
finalResult2 = minusFive (squared (timesTwo (addOne 1))) -- 11

-- 提取出这个finalResult2计算方式的函数
finalResultFun num = minusFive (squared (timesTwo (addOne num)))
-- 调用 finalResultFun 与 finalResult2的计算结果相同
f = finalResultFun 1 -- 11

addAB a b = a + b

sumAB = addAB (addAB 1 2) (addAB 3 4) -- addAB 3 7 = 10

main = print (add 3 5, multiply 4 6)  -- (8, 24)