-- https://atcoder.jp/contests/abc459/tasks/abc459_a

fn :: Int -> String
fn x =
    take (x - 1) str ++ drop x str
  where
    str = "HelloWorld"

main :: IO ()
main = do
    putStrLn (fn 5)
    -- HellWorld

    putStrLn (fn 9)
    -- HelloWord

    putStrLn (fn 1)
    -- elloWorld
