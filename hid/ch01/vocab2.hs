-- import Data.Char
-- import Data.List (group, sort)
-- import qualified Data.Text as T
-- import qualified Data.Text.IO as TIO
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  print args
  let list = ["primero", "segundo", "tercero"]
  let first = take 1 list
  print first