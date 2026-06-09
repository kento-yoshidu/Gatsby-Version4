-- https://atcoder.jp/contests/abc173/tasks/abc173_a

fn :: Int -> Int
fn n =
    (n + 999) `div` 1000 * 1000 - n

main :: IO ()
main = do
    print (fn 1900)
    -- 100


