module Roman where

solution :: String -> Int
solution [] = 0
solution ('I':'V':xs) = 4 + solution xs
solution ('I':'X':xs) = 9 + solution xs
solution ('X':'L':xs) = 40 + solution xs
solution ('X':'C':xs) = 90 + solution xs
solution ('C':'D':xs) = 400 + solution xs
solution ('C':'M':xs) = 900 + solution xs
solution ('I':xs) = 1 + solution xs
solution ('V':xs) = 5 + solution xs
solution ('X':xs) = 10 + solution xs
solution ('L':xs) = 50 + solution xs
solution ('C':xs) = 100 + solution xs
solution ('D':xs) = 500 + solution xs
solution ('M':xs) = 1000 + solution xs
