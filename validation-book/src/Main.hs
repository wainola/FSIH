module Main where
import Data.Char

newtype Password = Password String deriving Show
newtype Error = Error String deriving Show
newtype Username = Username String deriving Show

-- checkLength :: Int -> String -> Either Error String


checkPasswordLength :: String -> Either Error Password
checkPasswordLength password =
  case (length password < 10) || (length password > 20) of
    True -> Left (Error "Your password cannot be longer \
    \ than 20 characters")
    False -> Right (Password password)
  
checkUsernamesLength :: String -> Either Error Username
checkUsernamesLength name =
  case (length name > 15) of
    True -> Left (Error "Username cannot be longer than 15 characters")
    False -> Right (Username name)

requireAlphaNum :: String -> Either Error String
requireAlphaNum xs =
  case (all isAlphaNum xs) of
    False -> Left (Error "Your password need alpha numeric characters")
    True -> Right xs

cleanWhitespace :: String -> Either Error String
cleanWhitespace "" = Left (Error "No a valid passwors")
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

validatePassword :: Password -> Either Error Password
validatePassword (Password password) =
  cleanWhitespace password -- String -> Either Error String
  >>= requireAlphaNum -- String -> Either Error Password
  >>= checkPasswordLength -- String -> Either Error Password


printTestResult :: Either String () -> IO ()
printTestResult r =
  case r of
    Left err -> putStrLn err
    Right () -> putStrLn "All test passed."

  
-- eq :: (Eq a, Show a) => Int -> a -> a -> Either String ()
-- eq n actual expected =
--   case (actual == expected) of
--     True -> Right ()
--     False -> Left (unlines [ "Test " ++ show n, " Expected: " ++ show expected, " But got: " ++ show actual])

-- test :: IO()
-- test = printTestResult $
--   do
--     eq 1 (checkPasswordLength "somePassword") (Right "somePassword")
--     eq 2 (checkPasswordLength "wainolaLoveBooks") (Right "wainolaLoveBooks")

main :: IO ()
main = do
  putStrLn "Please enter a password"
  password <- Password <$> getLine
  print (validatePassword password)
