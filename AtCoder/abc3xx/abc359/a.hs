-- https://atcoder.jp/contests/abc359/tasks/abc359_a

fn :: Int -> [String] -> Int
fn _ = length . filter (== "Takahashi")

main :: IO ()
main = do
    print (fn 3 ["Aoki", "Takahashi", "Takahashi"])
    -- 2

    print (fn 2 ["Aoki", "Aoki"])
    -- 0

    print (fn 20 ["Aoki", "Takahashi", "Takahashi", "Aoki", "Aoki", "Aoki", "Aoki", "Takahashi", "Aoki", "Aoki", "Aoki", "Takahashi", "Takahashi", "Aoki", "Takahashi", "Aoki", "Aoki", "Aoki", "Aoki", "Takahashi"])
    -- 7
