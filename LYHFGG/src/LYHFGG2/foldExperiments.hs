data Person = Person { firstName :: String  
                     , lastName :: String 
                     } deriving (Show)   

persons :: [Person]
persons	= [
			Person {firstName ="M", lastName ="Peres"},
			Person {firstName ="M", lastName ="Peres"},
			Person {firstName ="M", lastName ="Peres"}
		  ]


checkFirstName :: [Person] -> Bool
checkFirstName l@((Person {firstName = n}):_) = checkFirstNameAcc n l
											    where 
											    	checkFirstNameAcc n [] = True
											    	checkFirstNameAcc n ((Person {firstName = m}):ys)
											    									 | n == m = True && checkFirstNameAcc n ys
											    									 | otherwise = False
