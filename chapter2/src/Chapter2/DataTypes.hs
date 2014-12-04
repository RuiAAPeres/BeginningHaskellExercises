module Chapter2.DataTypes where

data Client = GovOrg String
            | Company    String Integer String String
			| Individual Person Bool 
			deriving Show	

data Person = Person String String Gender
            deriving Show

data GenderStatistics = GenderStatistics Int Int
			deriving Show


data Gender = Male 
			| Female 
			| Unknown
			deriving Show


clientName :: Client -> String 
clientName client = case client of
				GovOrg name 				-> name 
				Company name _ _ _ -> name 
				Individual person _ 		-> 
					case person of Person fName lName _ -> fName ++ " " ++ lName

companyName :: Client -> Maybe String
companyName client = case client of
						Company name _ _ _ -> Just name 
						_ 				   -> Nothing



countGender :: [Gender] -> (Int, Int)
countGender list = countGender__acc list (0,0)
				   where 
						countGender__acc [] acc = acc
						countGender__acc (Male : list) acc = countGender__acc list ((fst acc + 1),snd acc)
						countGender__acc (Female : list) acc = countGender__acc list (fst acc, (snd acc + 1))


countGender' :: [Gender] -> GenderStatistics
countGender' list = let (x,y) = countGender list
					in GenderStatistics x y


