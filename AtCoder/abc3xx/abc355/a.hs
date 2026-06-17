-- https://atcoder.jp/contests/abc355/tasks/abc355_a

import Data.Bits (xor)

fn :: Int -> Int -> Int
fn a b
    | x == 0    = -1
    | otherwise = x
  where
    x = a `xor` b

main :: IO ()
main = do
    print (fn 1 2)
    -- 3

    print (fn 1 1)
    -- -1

    print (fn 3 1)
    -- 2
