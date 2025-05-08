-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
 -- 定义一个图形
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)
