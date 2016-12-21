module PIN where

import Data.Char

getPINs :: String -> [String]
getPINs observed = map (concatMap show) $ mapM (adjacent . digitToInt) observed

adjacent :: Int -> [Int]
adjacent x
  | x == 0 = [0, 8]
  | mod x 3 == 1 = filter (\x -> x > 0 && x < 10) [x, x+1, x-3, x+3]
  | mod x 3 == 0 = filter (\x -> x > 0 && x < 10) [x, x-1, x-3, x+3]
  | otherwise = filter (\x -> x >= 0 && x < 10) $ map (\x -> if x == 11 then 0 else x) [x, x+1, x-1, x-3, x+3]
