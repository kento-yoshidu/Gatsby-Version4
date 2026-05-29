-- https://atcoder.jp/contests/abc361/tasks/abc361_a

fn :: Int -> Int -> Int -> [Int] -> [Int]
fn _ k x a =
    take (k-1) a ++ [x] ++ drop (k-1) a

main :: IO ()
main = do
    print (fn 4 3 7 [2, 3, 5, 11])
    -- [2, 3, 7, 5, 11]

    print (fn 1 1 100 [100])
    -- [100, 100]

    print (fn 8 8 3 [9, 9, 8, 2, 4, 4, 3, 5])
    -- [9, 9, 8, 2, 4, 4, 3, 3, 5]
