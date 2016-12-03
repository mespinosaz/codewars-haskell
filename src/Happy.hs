module Happy where

isHappy :: Integer -> Bool
isHappy n = searchHappiness [] $ serie n

searchHappiness :: [Integer] -> [Integer] -> Bool
searchHappiness xs (y:ys)
  | y == 1 = True
  | y `elem` xs = False
  | otherwise = searchHappiness (y:xs) ys

serie :: Integer -> [Integer]
serie n = s : serie s
  where s = sumOfSquares n

sumOfSquares :: Integer -> Integer
sumOfSquares n = sum $ map (\x -> x * x) $ explodeNumber n

explodeNumber :: Integer -> [Integer]
explodeNumber n
  | n < 10 = [n]
  | otherwise = explodeNumber d ++ [r]
  where d = div n 10
        r = mod n 10
