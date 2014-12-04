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

data TimeMachine = TimeMachine String Float


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


timeMachinesDiscount :: [TimeMachine] -> Float -> [Float] 
timeMachinesDiscount [] _ = []
timeMachinesDiscount ((TimeMachine _ price):xs) discount = (price * (1 - discount/100)) : timeMachinesDiscount xs discount

-- timeMachinesDiscount [(TimeMachine "Wee1" 123), (TimeMachine "Wee2" 100),(TimeMachine "Wee3" 200)] 20

head' :: [a] -> a
head' [] = error "Empty list"
head' (x:_) = x 

tail' :: [a] -> [a]
tail' [] = []
tail' (_:xs) = xs

maxmin :: Ord a => [a] -> (a, a)
maxmin [x]    = (x,x)
maxmin (x:xs) = ( if x > xs_max then x else xs_max
                , if x < xs_min then x else xs_min
                ) where (xs_max, xs_min) = maxmin xs



ifibonacci :: Integer -> Maybe Integer
ifibonacci n = if n < 0
               then Nothing
               else case n of
                     0 -> Just 0
                     1 -> Just 1
                     n -> let Just f1 = ifibonacci (n-1)
                              Just f2 = ifibonacci (n-2)
                          in Just (f1 + f2)

ifibonacci' n | n < 0 = Nothing
ifibonacci' 0 = Just 0
ifibonacci' 1 = Just 1
ifibonacci'  n | otherwise = let (Just f1, Just f2) = (ifibonacci' (n-1), ifibonacci' (n-2))
                           in Just (f1 + f2)

ifibonacci''  n
			| n < 0 = Nothing
 			| n == 0 = Just 0
			| n == 1 = Just 1
			| otherwise = let (Just f1, Just f2) = (ifibonacci'' (n-1), ifibonacci'' (n-2))
                           in Just (f1 + f2)


