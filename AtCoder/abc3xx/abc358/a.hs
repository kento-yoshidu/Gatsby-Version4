-- https://atcoder.jp/contests/abc358/tasks/abc358_a

fn :: String -> String -> String
fn s t
    | s == "AtCoder" && t == "Land" = "Yes"
    | otherwise                     = "No"

main :: IO ()
main = do
    putStrLn (fn "AtCoder" "Land")
    -- Yes

    putStrLn (fn "CodeQUEEN" "Land")
    -- No

    putStrLn (fn "aTcodeR" "lANd")
    -- No
