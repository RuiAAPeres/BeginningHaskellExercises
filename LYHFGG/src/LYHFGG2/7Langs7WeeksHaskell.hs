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

--- • Solve the map-coloring problem (Section 4.2, Map Coloring, on page 101) using Haskell. (Taken from here https://github.com/tafsiri/7languages/blob/master/haskell/day1.hs and refactored)

colors = ["red", "green", "blue"]
colorings = [[("Alabama", col1), ("Mississippi", col2), ("Georgia", col3), ("Tennessee", col4), ("Florida", col5)] | 
	col1 <- colors,
    col2 <- colors,
    col3 <- colors,
    col4 <- colors,
    col5 <- colors,
    -- rules for alabama
    col1 /= col2,
    col1 /= col3,
    col1 /= col4,
    col1 /= col5,
    -- rules for missisippi
    col2 /= col5,
    -- rules for georgia
    col3 /= col4,
    col3 /= col5
    ]

