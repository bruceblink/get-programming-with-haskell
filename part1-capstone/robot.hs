-- robot的构造函数,有3个属性
robot (name, attack, hp) = \message -> (name, attack, hp)

-- 添加获取对象属性的辅助函数
name (n, _, _) = n
attack (_, a, _) = a
hp (_, _, hp) = hp

-- 添加get访问器函数
getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

-- 添加set访问器函数
setName aRobot newName = aRobot (\(n,a,h) -> robot (newName, a, h))
setAttack aRobot newAttack = aRobot (\(n,a,h) -> robot (n, newAttack, h))
setHP aRobot newHP = aRobot (\(n,a,h) -> robot (n, a, newHP))