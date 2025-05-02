module Lesson12 where
import Data.Text.Internal.Fusion (Stream)
patientInfo :: FirstName -> LastName -> Age -> Height -> String
patientInfo fname lname age height = name ++ " " ++ ageHeight
  where name = lname ++ ", " ++ fname
        ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

-- type synonyms: FirstName, LastName, Age, and Height
type FirstName = String
type LastName = String
type Age = Int
type Height = Int
-- type synonyms: PatientName
type PatientName = (String, String)
-- PatientName's  help function
firstName :: PatientName -> String 
firstName patient = fst patient 
lastName :: PatientName -> String 
lastName patient = snd patient

-- 创造新类型
data Sex = Male | Female
-- sexInitial 函数
sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

-- Defining the type RhType
data RhType = Pos | Neg
-- Defining the type ABOType
data ABOType = A | B | AB | O
-- Combining ABOType and RhType to create BloodTyp
data BloodType = BloodType ABOType RhType
-- BloodType
patient1BT :: BloodType 
patient1BT = BloodType A Pos 
patient2BT :: BloodType 
patient2BT = BloodType O Neg 
patient3BT :: BloodType
patient3BT = BloodType AB Pos

-- Displaying your types: showRh, showABO, showBloodType
showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

-- Defining the canDonateTo function
canDonateTo :: BloodType -> BloodType -> Bool 
canDonateTo (BloodType O _) _ = True 
canDonateTo _ (BloodType AB _) = True 
canDonateTo (BloodType A _) (BloodType A _) = True 
canDonateTo (BloodType B _) (BloodType B _) = True 
canDonateTo _ _ = False --otherwise

-- Support different names: MiddleName and Name
type MiddleName = String
data Name = Name FirstName LastName 
          | NameWithMiddle FirstName MiddleName LastName

-- Displaying multiple constructors: showName
showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName ((NameWithMiddle f m l)) = f ++ " " ++ m ++ " " ++ l

-- Patient v.1
data Patient = Patient Name Sex Int Int Int BloodType

johnDoe :: Patient
johnDoe = Patient (Name "John" "Doe") Male 30 74 200 (BloodType AB Pos)

-- getName, getAge, getBloodType
getName :: Patient -> Name 
getName (Patient n _ _ _ _ _) = n 
getAge :: Patient -> Int 
getAge (Patient _ _ a _ _ _) = a 
getBloodType :: Patient -> BloodType 
getBloodType (Patient _ _ _ _ _ bt) = bt

-- Patient v.2 (with record syntax)
data Patient2 = Patient2 { name :: Name 
                       , sex :: Sex 
                       , age :: Int 
                       , height :: Int 
                       , weight :: Int
                       , bloodType :: BloodType }

jackieSmith :: Patient2
jackieSmith = Patient2 {name = Name "Jackie" "Smith"
                      , age = 43 
                      , sex = Female 
                      , height = 62 
                      , weight = 115
                      , bloodType = BloodType O Neg }

