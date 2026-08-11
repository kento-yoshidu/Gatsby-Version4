-- https://atcoder.jp/contests/abc171/tasks/abc171_a

import Data.Bool (bool)
import Data.Char (isUpper)

fn :: Char -> Char
fn = bool 'a' 'A' . isUpper

main :: IO ()
main = do
    print (fn 'B')
    -- A

    print (fn 'a')
    -- a
