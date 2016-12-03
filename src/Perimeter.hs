module Perimeter where

perimeter :: Integer -> Integer
perimeter n = (*4) $ sum $ take (fromIntegral (n+1)) $ serie [1,1]

serie :: Num a => [a] -> [a]
serie [x, y] = x : serie [y, x + y]
