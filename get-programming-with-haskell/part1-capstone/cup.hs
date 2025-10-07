--cup f10z = \_ -> f10z

cup :: t1 -> (t1 -> t2) -> t2
cup flOz = \message -> message flOz -- 添加命名参数的cup"构造函数"

getOz :: ((t1 -> t1) -> t2) -> t2
getOz aCup = aCup (\f10z -> f10z)  --添加对象访问器(成员函数)

-- drink message 更新cup的状态
drink :: (Ord t2, Num t2) => ((t3 -> t3) -> t2) -> t2 -> (t2 -> t4) -> t4
drink aCup ozDrank = if ozDiff >= 0 -- 杯中的饮品容量最小为0,不能无限
                     then cup ozDiff
                     else cup 0
    where flOz = getOz aCup
          ozDiff = flOz - ozDrank
-- 判断cup的容量是否为空
isEmpty :: (Eq a, Num a) => ((t1 -> t1) -> a) -> Bool
isEmpty aCup = getOz aCup == 0