-- https://atcoder.jp/contests/abc363/tasks/abc363_a

fn :: Int -> Int
fn r =
    100 - r `mod` 100

main :: IO ()
main = do
    print (fn 123)
    -- 77

    print (fn 250)
    -- 50

    print (fn 200)
    -- 100
