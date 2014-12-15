module LYHGG2.Comprehension where

import Data.Map as M  
import Data.List as L  


-- data Vector a = Vector a a a deriving (Show)  
  
-- vplus :: (Num t) => Vector t -> Vector t -> Vector t  
-- (Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  
  
-- vectMult :: (Num t) => Vector t -> t -> Vector t  
-- (Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
  
-- scalarMult :: (Num t) => Vector t -> Vector t -> t  
-- (Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  


  
-- data LockerState = Taken | Free deriving (Show, Eq)  
  
-- type Code = String  
  
-- type LockerMap = Map.Map Int (LockerState, Code)  

-- lockerLookup :: Int -> LockerMap -> Either String Code  
-- lockerLookup lockerNumber map =   
--     case Map.lookup lockerNumber map of   
--         Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"  
--         Just (state, code) -> if state /= Taken   
--                                 then Right code  
--                                 else Left $ "Locker " ++ show lockerNumber ++ " is already taken!" 

-- lockers :: LockerMap  
-- lockers = Map.fromList   
--     [(100,(Taken,"ZD39I"))  
--     ,(101,(Free,"JAH3I"))  
--     ,(103,(Free,"IQSA9"))  
--     ,(105,(Free,"QOTSA"))  
--     ,(109,(Taken,"893JJ"))  
--     ,(110,(Taken,"99292"))  
--     ]  

class Functor' f where
        fmap' :: (a -> b) -> f a -> f b

instance (Ord k) => Functor' (M.Map k) where
    fmap' f =  M.fromList . L.map(\(k,v)->(k, f v)) . M.toList

-- class MyFunctor f where
--         myfmap :: (a -> b) -> f a -> f b

-- instance (Ord k) => MyFunctor (M.Map k) where
--         myfmap f x = M.fromList $ L.map (\(p,q) ->(p,f q)) $ M.toList x

