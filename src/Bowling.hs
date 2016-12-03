module Bowling where

bowlingScore :: [Int] -> Int
bowlingScore rs = bowlingScore' rs 0

bowlingScore' :: [Int] -> Int -> Int
bowlingScore' _ 10 = 0
bowlingScore' [r] _ = r
bowlingScore' (r1:r2:rs) rnd
  | r1 == 10 = r1 + bowlingScore' (r2:rs) (rnd+1) + strikeBonus
  | r1 + r2 == 10 = r1 + r2 + bowlingScore' rs (rnd+1) + spareBonus
  | otherwise = r1 + r2 + bowlingScore' rs (rnd+1)
    where spareBonus = head rs
          strikeBonus = r2 + head rs
