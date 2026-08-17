-- https://atcoder.jp/contests/abc175/tasks/abc175_a

fn :: String -> Int
fn = length . takeWhile (== 'R')

main :: IO ()
main = do
    print (fn "RRS")
    -- 2

    print (fn "SSS")
    -- 0

    print (fn "RSR")
    -- 1
