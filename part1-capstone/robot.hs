-- robot的构造函数,有3个属性
robot (name, attack, hp) = \message -> (name, attack, hp)

-- 添加获取对象属性的辅助函数
name (n, _, _) = n
attack (_, a, _) = a
hp (_, _, hp) = hp