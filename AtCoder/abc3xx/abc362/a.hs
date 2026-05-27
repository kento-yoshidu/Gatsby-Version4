-- https://atcoder.jp/contests/abc362/tasks/abc362_a

fn :: Int -> Int -> Int -> String -> Int
fn r g b c
    | c == "Red" = min g b
    | c == "Blue" = min r g
    | c == "Green" = min r b
    | otherwise    = error "unreachable"

main :: IO ()
main = do
    print (fn 20 30 10 "Blue")
    -- 20

    print (fn 100 100 100 "Red")
    -- 100

    print (fn 37 39 93 "Blue")
    -- 37
