ifEvenInc n = if even n
    then n + 1
    else n

ifEvenDouble n = if even n
    then n * 2
    else n

ifEvenSquare n = if even n
    then n ^ 2
    else n

ifEven myFunc n = if even n
    then myFunc n
    else n

ifEven1 myFunc1 myFunc2 n = if even n
    then myFunc1 n
    else myFunc2 n

-- 自定义排序
--按last name排序
compareLastName name1 name2 = if lastName1 > lastName2
    then GT
    else if lastName1 < lastName2
        then LT
        else EQ
    where lastName1 = snd name1
          lastName2 = snd name2

