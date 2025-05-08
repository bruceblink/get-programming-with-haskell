-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
 -- 定义一个图形
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

-- 移动一个图形
nudge :: Shape -> Float -> Float -> Shape
-- 移动Circle
nudge (Circle (Point x y) r) a b = Circle (Point (x + a) (y + b)) r
-- 移动矩形
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

-- Record 语法
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

-- 定义一个二叉树
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
-- 定义一个单节点的树
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- 树的元素插入
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)

-- 树的元素查找
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

nums = [8, 6, 4, 1, 7, 3, 5]
numsTree = foldr treeInsert EmptyTree nums
