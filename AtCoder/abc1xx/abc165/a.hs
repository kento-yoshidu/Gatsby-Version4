-- https://atcoder.jp/contests/abc165/tasks/abc165_a

fn :: Int -> Int -> Int -> String
fn k a b
    | any (\n -> n `mod` k == 0) [a..b] = "OK"
    | otherwise                         = "NG"

main :: IO ()
main = do
    putStrLn (fn 7 500 600)
    -- OK

    putStrLn (fn 4 5 7)
    -- NG

    putStrLn (fn 1 11 11)
    -- OK
