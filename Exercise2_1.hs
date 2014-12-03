--1. Rewrite the previous list literals using only (:) and the empty list constructor [].

--[['a','b','c'],['d','e']]

exercise1 :: [[Char]]
exercise1 = ('a':'b':'c':[]) : ('d' : 'e' : []) : [[]]