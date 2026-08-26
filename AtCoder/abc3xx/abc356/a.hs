-- https://atcoder.jp/contests/abc356/tasks/abc356_a

fn :: Int -> Int -> Int -> [Int]
fn n l r =
    let xs = [1..n]
    in take (l-1) xs ++ reverse (take (r-l+1) (drop (l-1) xs)) ++ drop r xs

main :: IO ()
main = do
    print (fn 5 2 3)
    -- [1, 3, 2, 4, 5]

    print (fn 7 1 1)
    -- [1, 2, 3, 4, 5, 6, 7]

    print (fn 10 1 10)
    -- [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
