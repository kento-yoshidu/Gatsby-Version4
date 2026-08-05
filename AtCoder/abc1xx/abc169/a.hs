-- https://atcoder.jp/contests/abc169/tasks/abc169_a

fn :: Int -> Int -> Int
fn a b = a * b

main :: IO ()
main = do
    print (fn 2 5)
    -- 10

    print (fn 100 100)
    -- 10000
