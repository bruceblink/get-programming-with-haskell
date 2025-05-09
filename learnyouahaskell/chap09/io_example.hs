import Data.Char (toUpper)
main = do
    putStrLn "Hello, what's your first name?"
    firstName <- getLine
    putStrLn ("what's your last name?")
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
