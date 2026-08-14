-- https://atcoder.jp/contests/abc002/tasks/abc002_1

fn :: Int -> Int -> Int
fn = max

main :: IO ()
main = do
    print (fn 10 11)
    -- 11

    print (fn 100000000 10000000)
    -- 100000000
