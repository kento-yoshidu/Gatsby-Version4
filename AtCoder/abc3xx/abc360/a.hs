-- https://atcoder.jp/contests/abc360/tasks/abc360_a

import Data.List (elemIndex)
import Data.Maybe (fromJust)

fn :: String -> String
fn s
    | r < m = "Yes"
    | otherwise = "No"
  where
    r = fromJust $ elemIndex 'R' s
    m = fromJust $ elemIndex 'M' s

main :: IO ()
main = do
    putStrLn (fn "RSM")
    -- Yes

    putStrLn (fn "SMR")
    -- No
