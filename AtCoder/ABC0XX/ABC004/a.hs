-- https://atcoder.jp/contests/abc004/tasks/abc004_1

fn :: Int -> Int
fn = (*2)

main :: IO ()
main = do
    print (fn 1000)
    -- 2000

    print (fn 1000000)
    -- 2000000

    print (fn 0)
    -- 0
