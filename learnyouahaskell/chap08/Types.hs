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