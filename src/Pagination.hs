module Pagination where

type Collection a = [a]
type ItemsPerPage = Int

itemCount :: Collection a -> Int
itemCount = length

pageCount :: Collection a -> ItemsPerPage -> Int
pageCount xs n
  | n < length xs = 1
  | otherwise = 1 + pageCount (drop n xs) n

pageItemCount :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageItemCount xs n page
  | page > pageCount xs n = Nothing
  | page == 0 = Just $ max n (length xs)
  | otherwise = pageItemCount (drop n xs) n (page-1)

pageIndex :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageIndex xs n item
  | null xs = Nothing
  | item < 0 = Nothing
  | otherwise = Just $ head $ dropWhile (\x -> x*5 < 6) $ iterate (+1) 1
