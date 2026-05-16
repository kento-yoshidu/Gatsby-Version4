-- https://atcoder.jp/contests/abc163/tasks/abc163_a

fn :: Int -> Float
fn r =
    fromIntegral r * 2.0 * pi

main :: IO ()
main = do
    print (fn 1)
    -- 6.2831855

    print (fn 73)
    -- 458.67255
