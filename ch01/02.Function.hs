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

main = print (add 3 5, multiply 4 6)  -- (8, 24)