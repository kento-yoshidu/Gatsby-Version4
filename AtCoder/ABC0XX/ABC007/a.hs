-- https://atcoder.jp/contests/abc007/tasks/abc007_1

fn :: Int -> Int
fn = subtract 1

main :: IO ()
main = do
    print (fn 4)
    -- 3

    print (fn 100)
    -- 99

    print (fn 1)
    -- 0
