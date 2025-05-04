module Chapter2 where

listisEmpty list = 
    if null list
    then putStrLn "this list is empty"
    else putStrLn ("the first element of this list is: " <> show (head list))
