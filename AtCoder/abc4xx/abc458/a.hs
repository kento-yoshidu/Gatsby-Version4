-- https://atcoder.jp/contests/abc458/tasks/abc458_a

fn :: String -> Int -> String
fn s n =
    take (length s - 2 * n) (drop n s)

main :: IO ()
main = do
    putStrLn (fn "chemotherapy" 3)
    -- mother

    putStrLn (fn "thermometer" 4)
    -- mom

    putStrLn (fn "burger" 1)
    -- urge
