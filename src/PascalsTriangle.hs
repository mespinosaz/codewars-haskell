module PascalsTriangle where

pascalsTriangle :: Int -> [Int]
pascalsTriangle n = foldr1 (++) (map pascalsTriangleRow [1..n])

pascalsTriangleRow :: Int -> [Int]
pascalsTriangleRow 1 = [1]
pascalsTriangleRow 2 = [1, 1]
pascalsTriangleRow n = triangleRow (pascalsTriangleRow (n-1))

triangleRow :: [Int] -> [Int]
triangleRow xs = [1] ++ triangleMiddleRow xs ++ [1]

triangleMiddleRow :: [Int] -> [Int]
triangleMiddleRow [] = []
triangleMiddleRow [x1] = []
triangleMiddleRow (x1:x2:xs) = (x1+x2) : triangleMiddleRow (x2:xs)
