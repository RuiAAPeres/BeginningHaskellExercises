{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE NamedFieldPuns #-}

module Chapter2.DataTypes where
import Data.Char

data Client = GovOrg String
			| JohnDoe String
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
ifibonacci' n | otherwise = let (Just f1, Just f2) = (ifibonacci' (n-1), ifibonacci' (n-2))
                           in Just (f1 + f2)

ifibonacci''  n
			| n < 0 = Nothing
 			| n == 0 = Just 0
			| n == 1 = Just 1
			| otherwise = let (Just f1, Just f2) = (ifibonacci'' (n-1), ifibonacci'' (n-2))
                           in Just (f1 + f2)

data ClientR = GovOrgR  { clientRName :: String }
             | CompanyR { clientRName :: String
                        , companyId :: Integer
                        , person :: PersonR
                        , duty :: String }
             | IndividualR { person :: PersonR }
             deriving Show


data PersonR = PersonR { firstName :: String
                       , lastName :: String
                       } deriving Show



nameInCapitals :: PersonR -> PersonR
nameInCapitals p@(PersonR { firstName = initial:rest , lastName = _ }) = let newName = (toUpper initial):rest
														  in  p { firstName = newName }
nameInCapitals p@(PersonR { firstName = "" , lastName = x}) = p { firstName = x}


data TimeMachineR = TimeMachineR { name :: String
								 , price :: Float
								 } deriving Show


changeTimeMachinePrice :: TimeMachineR -> Float -> TimeMachineR
changeTimeMachinePrice t p = t{price = p}

maybeString (Just _) = "Just"
maybeString Nothing  = "Nothing"


index []     = []
index [x]    = [(0,x)]
index (x:xs) = let indexed@((n,_):_) = index xs
               in (n+1,x):indexed


index' []     = []
index' [x]    = [(0,x)]
index' (x:xs) = let indexed@((n,_):_) = index xs
                in  (n+1,x):indexed



ackermann :: Int -> Int -> Int 
ackermann m n
			| m == 0 		  = n + 1
			| m > 0 && n == 0 = ackermann (m - 1) 1
			| otherwise       = ackermann (m - 1) (ackermann m (n-1))


zip' :: [(a,a)] -> [(a,a)]
zip' [] = []
zip' (_:[]) = zip' []
zip' ((x,y):(x',y'):xs) = (x,x'):(y,y'): zip' xs


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

responsibility :: Client -> String
responsibility (Company _ _ _ r) = r
responsibility _                 = "Unknown"

specialClient :: Client -> Bool
specialClient (clientName -> "Mr. Alejandro") = True 
specialClient (responsibility -> "Director") = True 
specialClient _ = False


<<<<<<< HEAD

filterOne :: (Num a, Eq a) => [a] -> [a]
filterOne x = filter (\y -> y == 1) x

filterNumber :: (Num a, Eq a) => [a] -> a -> [a]
filterNumber x n = filter (\y -> y == n) x

filterNotNumber :: (Num a, Eq a) => [a] -> a -> [a]
filterNotNumber x n = filter (not . \y -> y == n) x

filterGovOrgs :: [Client] -> [Client]
filterGovOrgs l@(x:xs) = filter isGovOrg l
				   where isGovOrg = \x -> case x of 
				   						 GovOrg _ -> True
				   						 _ -> False



(***) :: (a -> b) -> (c -> d) -> ((a,c) -> (b,d))
f *** g = \(x,y) -> (f x, g y)

duplicate :: a -> (a,a)
duplicate x = (x,x)

square :: Num a => a -> a
square n = (n*n)

-- uncurry :: (a -> b -> c) -> (a,b) -> c
-- uncurry f = \(x,y) -> f x y
-- curry :: ((a,b) -> c) -> a -> b -> c
-- curry f = \x y -> f (x,y)

-- 3x + 7(x + 2)
formula1 :: Integer -> Integer
formula1 = uncurry (+) . ( ((*7) . (+2)) *** (*3) ) . duplicate


formula2 :: Integer -> Integer 
formula2 x = x * (2*x + 13)

formula2' :: Integer -> Integer
formula2' = uncurry (*) . ( ((+13) . (*2)) *** (id)) . duplicate
=======

filterOne :: (Num a, Eq a) => [a] -> [a]
filterOne x = filter (\y -> y == 1) x
>>>>>>> 45980a5... Added filterOne

formula2'' :: Integer -> Integer
formula2'' = (+13) . (*2)
