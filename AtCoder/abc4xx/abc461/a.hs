-- https://atcoder.jp/contests/abc461/tasks/abc461_a

fn :: Int -> Int -> String
fn a d
    | a <= d    = "Yes"
    | otherwise = "No"

main :: IO ()
main = do
    putStrLn (fn 4 5)
    -- Yes

    putStrLn (fn 5 5)
    -- Yes

    putStrLn (fn 6 5)
    -- No
