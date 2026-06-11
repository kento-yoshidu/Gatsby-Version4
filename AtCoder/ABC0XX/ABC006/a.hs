-- https://atcoder.jp/contests/abc006/tasks/abc006_1

import Data.Bool (bool)

fn :: Int -> String
fn = bool "NO" "YES" . (==0) . (`mod` 3)

main :: IO ()
main = do
    print (fn 2)
    -- NO

    print (fn 9)
    -- YES

    print (fn 3)
    -- YES
