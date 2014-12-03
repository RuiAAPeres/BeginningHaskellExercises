--1. Rewrite the previous list literals using only (:) and the empty list constructor [].

--[['a','b','c'],['d','e']]

exercise1 :: [[Char]]
exercise1 = ('a':'b':'c':[]) : ('d' : 'e' : []) : [[]]

-- 2. Write an expression that checks whether a list is empty, [], or its first element is empty, like [[],['a','b']].

exercise2 :: [[a]] -> Bool 
exercise2 [] = True
exercise2 ([]:xs) = True
exercise2 _ = False

-- 3. Write an expression that checks whether a list has only one element. It should return True for ['a'] and False for [] or ['a','b'].

exercise3 :: [a] -> Bool 
exercise3 [] = False
exercise3 (_:[]) = True
exercise3 x = False

-- 4. Write an expression that concatenates two lists given inside another lists. For example, it should return "abcde" for ["abc","de"].

exercise4 :: [[a]] -> [a] 
exercise4 (x:y:[]) = x ++ y
