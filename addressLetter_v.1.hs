addressLetter name location = nameText ++ " - " ++ location
  where
    nameText = (fst name) ++ " " ++ (snd name)

-- nameText = "Dear " ++ name ++ ",\n"