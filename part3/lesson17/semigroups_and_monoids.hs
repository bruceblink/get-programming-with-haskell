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

-- 使用Semigroup 组合相似类型
instance Semigroup Integer where
    (<>) x y = x + y
-- (<>) :: Semigroup a => a -> a -> a

{- main :: IO ()
main = do
    let num1 = 5
    let num2 = 10
    let combined = num1 <> num2
    print combined -- 输出 15 -}

-- Defining the Color type
data Color = Red 
    | Yellow
    | Blue
    | Green
    | Purple
    | Orange 
    | Brown deriving (Show, Eq)

-- 为我们的Color实现Semigroup类型
{- instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Yellow Red = Orange
    (<>) Red Yellow = Orange
    (<>) a b = if a == b
               then a
               else Brown -}

-- 重写 Color 的 Semigroup 实例
instance Semigroup Color where
    (<>) Red Blue = Purple
    (<>) Blue Red = Purple
    (<>) Yellow Blue = Green
    (<>) Blue Yellow = Green
    (<>) Yellow Red = Orange
    (<>) Red Yellow = Orange
    (<>) a b | a == b = a
             | all (`elem` [Red, Blue, Purple]) [a, b] = Purple
             | all (`elem` [Blue, Yellow, Green]) [a, b] = Green
             | all (`elem` [Red, Yellow, Orange]) [a, b] = Orange
             | otherwise = Brown

-- `Monoid` 的合理定义
{- class Semigroup a => Monoid a where
    identity :: a -}

-- Monoid的实际定义
class Monoid a where
    mempty :: a
    mappend :: a -> a -> a
    mconcat :: [a] -> a

-- 概率表
{- Event	Probability
    Heads	0.5
    Tails	0.5 -}
-- 为概率表建模
type Events = [String]
type Probs = [Double]

data PTable = PTable Events Probs

-- createPTable 创建一个 PTable，并确保所有概率的总和为 1。
createPTable :: Events -> Probs -> PTable
createPTable events probs = PTable events normalizedProbs
  where totalProbs = sum probs
        normalizedProbs = map (\x -> x/totalProbs) probs

-- showPair 为单个事件-概率对创建一个 String
showPair :: String -> Double -> String
showPair event prob = Prelude.mconcat [event,"|", show prob,"\n"]

-- 为PTable 实现 Show接口
instance Show PTable where
    show (PTable events probs) = Prelude.mconcat pairs
        where pairs = zipWith showPair events probs

-- 列表的笛卡尔积
cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2 
  where nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = Prelude.mconcat repeatedL1
        cycledL2 = cycle l2

-- combineEvents and combineProbs
combineEvents :: Events -> Events -> Events
combineEvents e1 e2 = cartCombine combiner e1 e2
    where combiner = (\x y -> Prelude.mconcat [x, "-", y])
combineProbs :: Probs -> Probs -> Probs
combineProbs p1 p2 = cartCombine (*) p1 p2



-- PTable 实现 Semigroup
instance Semigroup PTable where
    (<>) ptable1 (PTable [] []) = ptable1
    (<>) (PTable [] []) ptable2 = ptable2
    (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
        where newEvents = combineEvents e1 e2
              newProbs = combineProbs p1 p2


instance Prelude.Monoid PTable where 
    mempty = PTable [] []
    mappend = (<>)



coin :: PTable
coin = createPTable ["heads","tails"] [0.5,0.5]
spinner :: PTable
spinner = createPTable ["red","blue","green"] [0.1,0.2,0.7]
