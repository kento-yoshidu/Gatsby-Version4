-- https://atcoder.jp/contests/abc178/tasks/abc178_a

fn :: Int -> Int
fn = fromEnum . (== 0)

main :: IO ()
main = do
    print (fn 1)
    -- 0

    print (fn 0)
    -- 1
