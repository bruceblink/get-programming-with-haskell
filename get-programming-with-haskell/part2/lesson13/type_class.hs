module Lessonn13 where
-- consider's answer
myInc x = x + 1

simple x = x

--- Describable class
class Describable a where 
  describe :: a -> String
--- Ord type class requires Eq type class
{- class Eq a => Ord a where
    compare :: a -> a -> Ordering
    (<) :: a -> a -> Bool
    (<=) :: a -> a -> Bool
    (>=) :: a -> a -> Bool
    (>) :: a -> a -> Bool
    max :: a -> a -> a
    min :: a -> a -> a -}
-- Eq 的定义
{- class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool -}

-- Bounded 的定义
class Bounded a where
    minBound :: a
    maxBound :: a

-- Show 的定义
{- class Show a where
    show :: a -> String -}

-- The Icecream type deriving the Show type class
--data Icecream = Chocolate | Vanilla deriving (Show)
-- 
data Icecream = Chocolate | Vanilla deriving (Show, Eq, Ord)
