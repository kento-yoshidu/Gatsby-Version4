-- https://atcoder.jp/contests/abc460/tasks/abc460_a

fn :: Int -> Int -> Int
fn n m =
    calc n m 0
  where
    calc n m count
        | m == 0    = count
        | otherwise = calc n (n `mod` m) count + 1

main :: IO ()
main = do
    print (fn 8 5)
    -- 3

    print (fn 14 6)
    -- 2

    print (fn 460 33)
    -- 5
