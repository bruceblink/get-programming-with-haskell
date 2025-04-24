module Lesson18 where
import Data.Char (toLower)

data Box a = Box a deriving Show
-- 定义Triple
data Triple a = Triple a a a deriving Show

-- 定义一个空间中的3D point
type Point3D = Triple Double
aPoint :: Point3D
aPoint = Triple 0.1 53.2 12.3

-- 定义人名
type FullName = Triple String
aPerson :: FullName
aPerson = Triple "Howard" "Phillips" "Lovecraft"

type Initials = Triple Char 
initials :: Initials
initials = Triple 'H' 'P' 'L'

-- 访问 Triple 类型
first :: Triple a -> a 
first (Triple x _ _) = x 

second :: Triple a -> a 
second (Triple _ x _ ) = x 

third :: Triple a -> a 
third (Triple _ _ x) = x

-- 将Triple 转换成 list
toList :: Triple a -> [a]
toList (Triple x y z) = [x, y, z]

transform :: (a -> a) -> Triple a -> Triple a
transform  f (Triple x y z) = Triple (f x) (f y) (f z)

{- -- Apply the transformation to initials
transformedInitials :: Initials
transformedInitials = transform toLower initials -}

-- 定义自己的list
data List a = Empty | Cons a (List a) deriving Show


itemCount1 :: (String,Int)
itemCount1 = ("Erasers",25)
itemCount2 :: (String,Int)
itemCount2 = ("Pencils",25)
itemCount3 :: (String,Int)
itemCount3 = ("Pens",13)

itemInventory :: [(String,Int)]
itemInventory = [itemCount1,itemCount2,itemCount3]

