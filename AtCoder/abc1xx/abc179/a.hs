-- https://atcoder.jp/contests/abc179/tasks/abc179_a

fn :: String -> String
fn s
    | last s == 's' = s ++ "es"
    | otherwise     = s ++ "s"

main :: IO ()
main = do
    putStrLn (fn "apple")
    -- apples

    putStrLn (fn "bus")
    -- buses

    putStrLn (fn "box")
    -- boxs
