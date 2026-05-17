-- https://atcoder.jp/contests/abc164/tasks/abc164_a

fn :: Int -> Int -> String
fn s w
    | w >= s    = "unsafe"
    | otherwise = "safe"

main :: IO ()
main = do
    putStrLn (fn 4 5)
    -- unsage

    putStrLn (fn 100 2)
    -- safe

    putStrLn (fn 10 10)
    --unsafe
