-- https://atcoder.jp/contests/abc174/tasks/abc174_a

import Data.Bool (bool)

fn :: Int -> String
fn = bool "No" "Yes" . (<=) 30

main :: IO ()
main = do
    putStrLn (fn 25)
    -- No

    putStrLn (fn 30)
    -- Yes
