import Control.Monad  
import Data.Char  
  
main = interact $ unlines . filter ((<20) . length) . lines 
