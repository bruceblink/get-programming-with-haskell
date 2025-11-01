helloWorld = "Hello, World!"
number5 = 5
-- number5 = 10  编译错误：重复定义
sumNumbers = number5 + 10
-- 拼接字符串和数字 比较老套的做法
greetingMessage = helloWorld ++ " The number is " ++ show number5
-- 使用 <> 操作符 拼接字符串和数字 是更简洁 通用的做法
greetingMessage2 =  helloWorld <> " " <> show number5