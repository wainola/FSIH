module Main where
import Data.Char

checkPasswordLength :: String -> Maybe String
checkPasswordLength password =
  case (length password < 10) || (length password > 20) of
    True -> Nothing
    False -> Just password

requireAlphaNum :: String -> Maybe String
requireAlphaNum xs =
  case (all isAlphaNum xs) of
    False -> Nothing
    True -> Just xs

cleanWhitespace :: String -> Maybe String
cleanWhitespace "" = Nothing
cleanWhitespace (x : xs) =
  case (isSpace x) of
    True -> cleanWhitespace xs
    False -> Just(x : xs)

checkPassword :: String -> String
checkPassword password =
  case (cleanWhitespace password) of
    Nothing -> "Empty password are not valid ones"
    Just password -> case (checkPasswordLength password) of
      Nothing -> "The length of your password must be between 10 and 20 characters"
      Just password -> case (requireAlphaNum password) of
        Nothing -> "Your password require letters and numbers"
        Just password -> "Valid password"

validatePassword :: String -> Maybe String
validatePassword password =
  cleanWhitespace password
  >>= requireAlphaNum
  >>= checkPasswordLength

main :: IO ()
main = do
  putStrLn "Please enter a password"
  password <- getLine
  print (validatePassword password)
