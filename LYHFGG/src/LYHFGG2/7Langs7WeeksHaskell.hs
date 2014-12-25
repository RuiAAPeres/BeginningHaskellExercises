--- • How many different ways can you find to write allEven?

allEven :: [Int] -> Bool
allEven [] = True
allEven (x:xs) = even x && allEven xs

allEven' :: [Int] -> Bool
allEven' = and . map (even)