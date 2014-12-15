import Control.Monad  

-- main = do   
--     line <- getLine  
--     if null line  
--         then return ()  
--         else do  
--             putStrLn $ reverseWords line  
--             main  
  
-- reverseWords :: String -> String  
-- reverseWords = unwords . map reverse . words  


-- main = do     
--     c <- getChar  
--     if c /= ' '  
--         then do  
--             putChar c  
--             main  
--         else return ()  



main = do   
    colors <- forM [1,2,3,4] (\a -> do  
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"  
        getLine)  
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "  
    mapM_ putStrLn colors  