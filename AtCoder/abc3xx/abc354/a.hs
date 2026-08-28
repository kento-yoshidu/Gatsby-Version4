-- https://atcoder.jp/contests/abc354/tasks/abc354_a

fn :: Int -> Int
fn h =
    go h 0 0
  where
    go h cur count
        | cur > h   = count
        | otherwise = go h (cur + 2 ^ count) (count + 1)

main :: IO ()
main = do
    print (fn 54)
    -- 6

    print (fn 7)
    -- 4

    print (fn 262144)
    -- 19
