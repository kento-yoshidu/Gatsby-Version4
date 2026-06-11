-- https://atcoder.jp/contests/abc357/tasks/abc357_a

calc :: Int -> Int -> [Int] -> Int
calc count _ [] = count
calc count m (x:xs)
    | m < x     = count
    | otherwise = calc (count + 1) (m - x) xs

fn :: Int -> Int -> [Int] -> Int
fn n = calc 0

main :: IO ()
main = do
    print (fn 5 10 [2, 3, 2, 5, 3])
    -- 3

    print (fn 5 10 [2, 3, 2, 3, 5])
    -- 4

    print (fn 1 5 [1])
    -- 1
