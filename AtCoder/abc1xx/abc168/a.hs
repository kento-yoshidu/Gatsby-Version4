-- https://atcoder.jp/contests/abc168/tasks/abc168_a

fn :: Int -> String
fn n
    | m `elem` [0,6,8] = "pon"
    | m == 3 = "bon"
    | otherwise = "hon"
  where
    m = n `mod` 10

main :: IO ()
main = do
    putStrLn (fn 16)
    -- pon

    putStrLn (fn 2)
    -- hon

    putStrLn (fn 183)
    -- bon
