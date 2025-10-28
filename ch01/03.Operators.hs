module Operators where
import Prelude hiding ((**)) -- 隐藏 Prelude 中的 ** 操作符
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

-- 操作符优先级和结合性示例
nine = 1 +++ 2 * 3  -- (1 + 2) * 3 = 9，默认情况下自定义的 +++ 的优先级高于 *
-- 使用 :info 命令查看操作符和类型类的信息
{- ghci> :info (+++)
(+++) :: Num a => a -> a -> a   -- Defined at 03.Operators.hs:3:1
infixl 9 +++
ghci> :info (+)  
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in ‘GHC.Internal.Num’
infixl 6 + -}
-- 设置自定义操作符的优先级和结合性
infixl 6 +++
-- 现在 +++ 的优先级与 + 相同，都是 6，左结合
result3 = 1 +++ 2 * 3  -- 1 + (2 * 3) = 7

-- 定义两个自定义操作符 ** 和 %%
(**) a b = a * b  -- 定义乘法操作符 使用隐藏的 Prelude 中的 **
(%%) a b = a + b

result4 = 2 ** 3 %% 4  -- (2 * 3) + 4 = 10