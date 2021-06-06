module Main where
import Data.Char

checkPasswordLength :: String -> Either String String
checkPasswordLength password =
  case (length password < 10) || (length password > 20) of
    True -> Left "Your password cannot be longer \
    \ than 20 characters"
    False -> Right password

requireAlphaNum :: String -> Either String String
requireAlphaNum xs =
  case (all isAlphaNum xs) of
    False -> Left "Your password need alpha numeric characters"
    True -> Right xs

cleanWhitespace :: String -> Either String String
cleanWhitespace "" = Left "No a valid passwors"
cleanWhitespace (x : xs) =
  case (isSpace x) of
    True -> cleanWhitespace xs
    False -> Right (x : xs)

-- checkPassword :: String -> String
-- checkPassword password =
--   case (cleanWhitespace password) of
--     Nothing -> "Empty password are not valid ones"
--     Just password -> case (checkPasswordLength password) of
--       Nothing -> "The length of your password must be between 10 and 20 characters"
--       Just password -> case (requireAlphaNum password) of
--         Nothing -> "Your password require letters and numbers"
--         Just password -> "Valid password"

validatePassword :: String -> Either String String
validatePassword password =
  cleanWhitespace password
  >>= requireAlphaNum
  >>= checkPasswordLength


printTestResult :: Either String () -> IO ()
printTestResult r =
  case r of
    Left err -> putStrLn err
    Right () -> putStrLn "All test passed."

  
eq :: (Eq a, Show a) => Int -> a -> a -> Either String ()
eq n actual expected =
  case (actual == expected) of
    True -> Right ()
    False -> Left (unlines [ "Test " ++ show n, " Expected: " ++ show expected, " But got: " ++ show actual])

test :: IO()
test = printTestResult $
  do
    eq 1 (checkPasswordLength "somePassword") (Right "somePassword")
    eq 2 (checkPasswordLength "wainolaLoveBooks") (Right "wainolaLoveBooks")

main :: IO ()
main = do
  putStrLn "Please enter a password"
  password <- getLine
  print (validatePassword password)
