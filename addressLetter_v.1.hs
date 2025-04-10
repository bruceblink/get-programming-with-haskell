addressLetter name location = nameText ++ " - " ++ location
  where
    nameText = (fst name) ++ " " ++ (snd name)

-- nameText = "Dear " ++ name ++ ",\n"

-- San Francisco office
sfOffice name =
  if lastName < "L"
    then nameText ++ " -PO Box 1234 - San Francisco, CA, 94111"
    --- last name 在L后面的
    else nameText ++ " -PO Box 1010 - San Francisco, CA, 94109"
  where
    lastName = snd name
    nameText = (fst name) ++ " " ++ (snd name)

-- New York office
nyOffice name = nameText ++ ": PO Box 789 - New York, NY, 10013"
  where
    nameText = (fst name) ++ " " ++ (snd name)

-- Reno office
renoOffic name = nameText ++ " - PO Box 456 - Reno, NV 89523"
  where
    nameText = snd name