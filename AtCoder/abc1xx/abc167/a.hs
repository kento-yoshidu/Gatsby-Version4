-- https://atcoder.jp/contests/abc167/tasks/abc167_a

fn :: String -> String -> String
fn s t
    | s == dropped = "Yes"
    | otherwise   = "No"
  where
      dropped = init t

main :: IO ()
main = do
    putStrLn (fn "chokudai" "chokudaiz")
    -- Yes

    putStrLn (fn "snuke" "snekee")
    -- No

    putStrLn (fn "a" "aa")
    -- Yes
