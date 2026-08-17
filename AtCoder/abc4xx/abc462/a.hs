-- https://atcoder.jp/contests/abc462/tasks/abc462_a

import Data.Char (isDigit)

fn :: String -> String
fn = filter isDigit

main :: IO ()
main = do
    putStrLn (fn "abc462")
    -- 462

    putStrLn (fn "codequeen")
    --

    putStrLn (fn "31415")
    -- 31415

    putStrLn (fn "10plus2is12")
    -- 10212
