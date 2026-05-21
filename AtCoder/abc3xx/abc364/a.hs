-- https://atcoder.jp/contests/abc364/tasks/abc364_a

fn :: Int -> [String] -> String
fn n s
    | n == 1                   = "Yes"
    | any fun (take (n - 2) (zip s (tail s))) = "No"
    | otherwise                = "Yes"
  where
    fun (a, b) = a == "sweet" && b == "sweet"

main :: IO ()
main = do
    putStrLn (fn 5 ["salty", "sweet", "salty", "salty", "sweet"])
    -- Yes

    putStrLn (fn 4 ["sweet", "salty", "sweet", "sweet"])
    -- Yes

    putStrLn (fn 6 ["salty", "sweet", "sweet", "salty", "sweet", "sweet"])
    -- No
