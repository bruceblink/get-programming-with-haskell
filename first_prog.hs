messyMain :: IO ()
messyMain = do
    print "Who is the email for?"
    recipient <- getLine
    print "What is the Title?"
    title <- getLine
    print "Who is the author?"
    author <- getLine

    print ("Dear " ++ recipient ++ ",\n" ++
        "Thanks for buying " ++ title ++ ".\nthanks,\n" ++
        author)

toPart recipient = "Dear " ++ recipient ++ ",\n"
fromPart author = "thanks,\n" ++ author
titlePart title = "Thanks for buying " ++ title ++ ".\n"
createEmail recipient title author =
    toPart recipient ++ titlePart title ++ fromPart author