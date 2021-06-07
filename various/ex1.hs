import Data.List

list = [1, 2, 3]

first = take 1 list

main :: IO ()
main = do
  print first