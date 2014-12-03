--1. Rewrite the previous list literals using only (:) and the empty list constructor [].

--[['a','b','c'],['d','e']]

exercise1 :: [[Char]]
exercise1 = ('a':'b':'c':[]) : ('d' : 'e' : []) : [[]]

--2. Write an expression that checks whether a list is empty, [], or its first element is empty, like [[],['a','b']].

exercise2 :: [[a]] -> Bool 
exercise2 [] = True
exercise2 ([]:xs) = True
exercise2 _ = False