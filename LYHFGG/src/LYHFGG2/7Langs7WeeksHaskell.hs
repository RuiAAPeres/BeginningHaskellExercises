--- • How many different ways can you find to write allEven?

allEven :: [Int] -> Bool
allEven [] = True
allEven (x:xs) = even x && allEven xs

allEven' :: [Int] -> Bool
allEven' = and . map (even)

allEven'' :: [Int] -> Bool
allEven'' = foldr (&&) True . map (even)

--- • Write a function that takes a list and returns the same list in reverse.

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

--- • Write a function that builds two-tuples with all possible combinations of two of the colors black, white, blue, yellow, and red. Note that you should include only one of (black, blue) and (blue, black).

data Color = Black | White | Blue | Yellow | Red deriving(Enum,Show,Eq)

colorCombination :: [(Color,Color)] 
colorCombination = [(x,y) | x <- [Black ..], y <- [x ..], x /= y]

--- • Write a list comprehension to build a childhood multiplication table. The table would be a list of three-tuples where the first two are integers from 1–12 and the third is the product of the first two.

multiplicationTable :: [(Int,Int,Int)]
multiplicationTable = [(x,y,x*y) | x <-[1..12], y <- [1..12], x /= y]