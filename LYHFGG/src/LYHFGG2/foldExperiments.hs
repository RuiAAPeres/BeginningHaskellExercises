import Data.List
import Control.Applicative

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
checkFirstName''' (x:xs) = any (==  firstName x) $ map firstName xs


checkFirstName'''' :: [Person] -> Bool
checkFirstName'''' = (== 1) . length . nub . map firstName



sequenceA :: Applicative f => [f a] -> f [a]
sequenceA = foldr (liftA2 (:)) (pure [])

 

data Foo a b = Foo a b

newtype Pair b a = Pair { getPair :: (a,b) }

instance Functor (Pair c) where  
    fmap f (Pair (x,y)) = Pair (f x, y) 


newtype CharList a = CharList { getCharList :: [a] }  

instance Functor CharList where
	fmap f (CharList xs) = CharList (fmap f xs)

instance Applicative CharList where
	pure x = CharList [x]
	(CharList f) <*> (CharList g) = CharList ( f <*> g) 	


