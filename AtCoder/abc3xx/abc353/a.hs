-- https://atcoder.jp/contests/abc353/tasks/abc353_a

import Data.List (findIndex)
import Data.Maybe (fromMaybe)

fn :: Int -> [Int] -> Int
fn n h =
    fromMaybe (-1) $ fmap (+1) $ findIndex (> x) h
  where x = h !! 0

main :: IO ()
main = do
    print (fn 4 [3, 2, 5, 2])
    -- 3

    print (fn 3 [4, 3, 2])
    -- -1

    print (fn 7 [10, 5, 10, 2, 10, 13, 15])
    -- 6
