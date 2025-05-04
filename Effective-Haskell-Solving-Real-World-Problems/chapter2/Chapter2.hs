module Chapter2 where

listisEmpty list = 
    if null list
    then putStrLn "this list is empty"
    else putStrLn ("the first element of this list is: " <> show (head list))

countdown n = 
    if n <= 0
    then []
    else n : countdown (n - 1)

factors num =
  factors' num 2
  where factors' num fact
          | num == 1 = []
          | (num `rem` fact) == 0 = fact : factors' (num `div` fact) fact
          | otherwise   = factors' num (fact + 1)