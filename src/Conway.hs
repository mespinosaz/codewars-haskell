module Conway where

lookSay :: Integer -> Integer
lookSay n = read (conway $ show n) :: Integer

conway :: String -> String
conway [] = []
conway (x:xs) = show (count (==x) xs) ++ [x] ++ conway (filter (/=x) xs)

count :: (a -> Bool) -> [a] -> Int
count x = (+1) . length . filter x
