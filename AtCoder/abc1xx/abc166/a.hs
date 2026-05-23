-- https://atcoder.jp/contests/abc166/tasks/abc166_a

fn :: String -> String
fn s
    | s == "ABC" = "ARC"
    | otherwise  = "ABC"

main :: IO ()
main = do
    putStrLn (fn "ABC")
    -- ARC
