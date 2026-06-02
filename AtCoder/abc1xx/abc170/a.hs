-- https://atcoder.jp/contests/abc170/tasks/abc170_a

import Data.List (elemIndex)
import Data.Maybe (fromJust)

fn :: [Int] -> Int
fn = (+1) . fromJust . elemIndex 0

main :: IO ()
main = do
    print (fn [0, 2, 3, 4, 5])
    -- 1

    print (fn [1, 2, 0, 4, 5])
    -- 3
