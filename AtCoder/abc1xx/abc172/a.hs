-- https://atcoder.jp/contests/abc172/tasks/abc172_a

fn :: Int -> Int
fn a =
    a + a * a + a * a * a

main :: IO ()
main = do
    print (fn 2)
    -- 14

    print (fn 10)
    -- 1110
