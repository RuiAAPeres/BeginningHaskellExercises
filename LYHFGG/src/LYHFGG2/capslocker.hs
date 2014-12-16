import Control.Monad  
import Data.Char  
  
main = interact $ unlines . filter ((<20) . length) . lines 


respondPalindromes = unlines . map (\xs -> if isPalindrome xs then "palindrome" else "not a palindrome") . lines  
    where   isPalindrome xs = xs == reverse xs  