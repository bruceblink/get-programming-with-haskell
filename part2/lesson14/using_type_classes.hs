module Lesson14 where
-- 定义 SixSidedDie
data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 

{- instance Show SixSidedDie where
  show S1 = "One"
  show S2 = "Two"
  show S3 = "Three"
  show S4 = "Four"
  show S5 = "Five"
  show S6 = "Six" -}

show :: SixSidedDie -> String 
show S1 = "one"
show S2 = "two"
show S3 = "three"
show S4 = "four"
show S5 = "five"
show S6 = "six"

-- 演示多态性需求：为 TwoSidedDie 定义 show
{- data TwoSideDie = One | Two
show :: TwoSideDie -> String
show One = "one"
show Two = "two" -}

instance Eq SixSidedDie where
    (==) S6 S6 = True
    (==) S5 S5 = True
    (==) S4 S4 = True
    (==) S3 S3 = True
    (==) S2 S2 = True
    (==) S1 S1 = True
    (==) _ _ = True

-- 复杂类型

{- type Name = (String,String)
names :: [Name]
names = [ ("Emil","Cioran"), ("Eugene","Thacker"), ("Friedrich","Nietzsche")] -}
-- 为别名类型 实现Ord
{- 
instance Ord Name where
    compare (f1, l1) (f2, l2) = compare (l1, f1) (l2, f2) -}
-- 定义新的类型type using data
data Name = Name (String, String) deriving (Show, Eq)

-- 为Name 实现 Ord
instance Ord Name where
    compare (Name (f1, l1)) (Name (f2, l2)) = compare (l1, f1) (l2, f2)
names :: [Name]
names = [Name ("Emil","Cioran"), 
         Name ("Eugene","Thacker"), 
         Name ("Friedrich","Nietzsche")
        ]


