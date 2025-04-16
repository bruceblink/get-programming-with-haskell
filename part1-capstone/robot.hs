module Lesson10 where

robot (name, attack, hp) = \message -> message (name, attack, hp)

killerRobot = robot ("Kill3r", 25, 200)
name (n, _, _) = n
attack (_, a, _) = a
hp (_, _, hp) = hp

getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

setName aRobot newName = aRobot (\(n, a, h) -> robot (newName, a, h))
setAttack aRobot newAttack = aRobot (\(n, a, h) -> robot (n, newAttack, h))
setHP aRobot newHP = aRobot (\(n, a, h) -> robot (n, a, newHP))

printRobot aRobot =
  aRobot (\(n, a, h) -> n ++ " attack:" ++ show a ++ " hp:" ++ show h)

damage aRobot attackDamage =
  aRobot (\(n, a, h) -> robot (n, a, h - attackDamage))

--

fight aRobot defender = damage defender attack
  where attack = if getHP aRobot > 10 then getAttack aRobot else 0

--
-- Why stateless programming matters
--

fastRobot = robot ("speedy", 15, 40)
slowRobot = robot ("slowpoke", 20, 30)

slowRobotRound1 = fight fastRobot slowRobot 
fastRobotRound1 = fight slowRobotRound1 fastRobot 
slowRobotRound2 = fight fastRobotRound1 slowRobotRound1 
fastRobotRound2 = fight slowRobotRound1 fastRobotRound1 
slowRobotRound3 = fight fastRobotRound2 slowRobotRound2 
fastRobotRound3 = fight slowRobotRound3 fastRobotRound2

