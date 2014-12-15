map' :: (a->b) -> [a] -> [b]
map' f = foldr (\x acc-> (f x) : acc) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\y acc -> if (f y) then y:acc else acc) []

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' f = foldl (\acc y -> if (f y) then acc ++ [y] else acc) []


sum'' :: Num a => [a] -> a
sum'' = foldl (+) 0