myGCD a b = if remainder == 0
    then b
    else myGCD b remainder
 where remainder = a `mod` b

myGCD1 a b = case remainder of
    0 -> b
    _ -> myGCD1 b remainder
 where remainder = a `mod` b
