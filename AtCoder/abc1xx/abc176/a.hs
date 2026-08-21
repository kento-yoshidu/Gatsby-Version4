-- https://atcoder.jp/contests/abc176/tasks/abc176_a

fn :: Int -> Int -> Int -> Int
fn n x t =
    (n + x - 1) `div` x * t

main :: IO ()
main = do
    print (fn 20 12 6)
    -- 12

    print (fn 1000 1 1000)
    -- 1000000
