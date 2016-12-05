module ISBN where

import Data.List
import Data.Maybe

validISBN10 :: String -> Bool
validISBN10 s
  | length s /= 10 = False
  | isJust xpos && xpos /= Just 9 = False
  | not $ all (`elem` validValues) s = False
  | otherwise = (==0) $ mod (sum $ zipWith (*) (map toInt s) [1..10]) 11
    where xpos = elemIndex 'X' s
          validValues = "X0123456789"

toInt :: Char -> Integer
toInt n
  | n == 'X' = 10
  | otherwise = read [n] :: Integer
