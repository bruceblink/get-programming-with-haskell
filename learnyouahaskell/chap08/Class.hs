-- 定义类型类（interface）
class YesNo a where
    yesno :: a -> Bool

-- 实现类型类
instance YesNo Int where
    yesno 0 = False
    yesno _ = True

