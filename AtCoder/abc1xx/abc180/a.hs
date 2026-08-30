-- https://atcoder.jp/contests/abc180/tasks/abc180_a

fn :: Int -> Int -> Int -> Int
fn n a b =
    n - a + b

main :: IO ()
main = do
    print (fn 100 1 2)
    -- 101

    print (fn 100 2 1)
    -- 99

    print (fn 100 1 1)
    -- 100
