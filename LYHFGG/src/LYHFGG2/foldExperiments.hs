data Person = Person { firstName :: String  
                     , lastName :: String 
                     } deriving (Show)   

persons :: [Person]
persons	= [
			Person {firstName ="M", lastName ="Peres"},
			Person {firstName ="M", lastName ="Peres"},
			Person {firstName ="Z", lastName ="Peres"}
		  ]


checkFirstName :: [Person] -> Bool
checkFirstName l@((Person {firstName = n}):_) = checkFirstNameAcc n l
											    where 
											    	checkFirstNameAcc n [] = True
											    	checkFirstNameAcc n ((Person {firstName = m}):ys)
											    									 | n == m = True && checkFirstNameAcc n ys
											    									 | otherwise = False

checkFirstName' :: [Person] -> Bool
checkFirstName' xs = let n = (firstName . head) xs
						   in foldr (\x acc -> if (firstName x) == n then True && acc else False) True xs


checkFirstName'' :: [Person] -> Bool
checkFirstName'' (x:xs) =  all (== (firstName x)) (map firstName xs)

checkFirstName''' :: [Person] -> Bool
checkFirstName''' (x:xs) = any (==  (firstName x)) $ map firstName xs