-- https://atcoder.jp/contests/abc177/tasks/abc177_a

fn :: Int -> Int -> Int -> String
fn d t s
    | d <= t * s = "Yes"
    | otherwise  = "No"

main :: IO ()
main = do
    putStrLn (fn 1000 15 80)
    -- Yes

    putStrLn (fn 2000 20 100)
    -- Yes

    putStrLn (fn 10000 1 1)
    -- No
