module Chapter3.Lists where

import Data.List

filter2 :: (a->Bool) -> [a] -> [a]
filter2 _ [] = []
filter2 f (x:xs) | f x = x :  xs'
                 | otherwise =  xs'
                 where xs' = filter2 f xs 
 

data InfNumber a = MinusInfinity
                 | Number a
                 | PlusInfinity
                 deriving Show

infMax MinusInfinity x        = x
infMax x MinusInfinity        = x
infMax PlusInfinity  _        = PlusInfinity
infMax _  PlusInfinity        = PlusInfinity
infMax (Number a) (Number b)  = Number (max a b)



data Client = Client { clientName :: String }
              deriving Show


product' :: [Integer] -> Integer
product' [] = 1 
product' (x:xs) = x * (product' xs)

product'' :: [Integer] -> Integer
product'' [] = 1 
product'' (x:xs) = product'' (xs) * x 


shortestName :: [Client] -> Client
shortestName [] = error "empty list"
shortestName [x] = x
shortestName (x:y:xs) 
                  | compareClient x y == GT = shortestName (x:xs)
                  | otherwise               = shortestName (y:xs)
                  where compareClient c1 c2 = compare (clientName c1) (clientName c2)

all' :: [Bool] -> Bool
all' [] = True
all' (False:_) = False
all' (_:xs)  = all' xs 


productFold :: [Integer] -> Integer
productFold x = foldr (*) 1 x 


compareClientName :: Client -> Client -> Client
compareClientName c1 c2 | comparison == GT = c1
                        | otherwise = c2
                        where comparison = compare (clientName c1) (clientName c2)

shortestNameFold :: [Client] -> Client 
shortestNameFold = foldl1 (compareClientName) 

allFold :: [Bool] -> Bool
allFold = foldl (&&) True


partition' :: (a -> Bool) -> [a] -> ([a],[a])
partition' f x = partitionAcc x ([],[])
                 where partitionAcc (x:xs) (a,b) | f x = partitionAcc xs ((x:a),b)
                                                 | otherwise = partitionAcc xs (a,(x:b))
                       partitionAcc [] (a,b) = (reverse a, reverse b)

between :: a -> [a] -> [[a]]
between i [] = [[i]]
between i r@(x:xs) = (i : r) : map (x:) (between i xs)

nubBy' :: (a -> a -> Bool) -> [a] -> [a]
nubBy' f l = nubByAcc l []
             where nubByAcc [] _ = []
                   nubByAcc (y:ys) xs  
                              | elem_by f y xs = nubByAcc ys xs
                              | otherwise = y : nubByAcc ys (y:xs)

elem_by :: (a -> a -> Bool) -> a -> [a] -> Bool
elem_by _  _ []         =  False
elem_by eq y (x:xs)     =  y `eq` x || elem_by eq y xs



elem' :: Eq a => a -> [a] -> Bool
elem' x l = case find (==x) l of
                Just _ -> True
                Nothing -> False
                  