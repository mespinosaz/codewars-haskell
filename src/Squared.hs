module Squared where

listSquared :: Int -> Int -> [(Int, Int)]
listSquared m n = filter (\(_, y) -> isSquare y) $ map (\x -> (x, sumSquares x))[m..n]

sumSquares :: Int -> Int
sumSquares x = sum $ map (\y -> y*y) $ filter (\y -> x `mod` y == 0) [1..x]

isSquare :: Int -> Bool
isSquare n = truncate (sqrt x) * truncate (sqrt x) == n
    where x = fromIntegral n
