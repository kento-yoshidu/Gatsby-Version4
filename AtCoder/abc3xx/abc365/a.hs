-- https://atcoder.jp/contests/abc365/tasks/abc365_a

fn :: Int -> Int
fn y
    | y `mod` 4 /= 0   = 365
    | y `mod` 100 /= 0 = 366
    | y `mod` 400 /= 0 = 365
    | otherwise        = 366

main :: IO ()
main = do
    print (fn 2023)
    -- 365

    print (fn 1992)
    -- 366

    print (fn 1800)
    -- 365

    print (fn 1600)
    -- 366
