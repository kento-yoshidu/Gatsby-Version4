-- https://atcoder.jp/contests/abc463/tasks/abc463_a

fn :: Int -> Int -> String
fn x y
    | x * 9 == y * 16 = "Yes"
    | otherwise       = "No"

main :: IO ()
main = do
    putStrLn (fn 800 450)
    -- Yes

    putStrLn (fn 234 108)
    -- No

    putStrLn (fn 108 192)
    -- No
