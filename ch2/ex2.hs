import Data.Char
import Data.List

isPalindrome :: String -> String -> Bool
isPalindrome word1 word2 = (reverse word1) == (reverse word2)

isWord :: String -> Maybe String
isWord word =
    case (null word) of
        True -> Nothing
        False -> case (all isAlpha word) of
            False -> Nothing
            True -> Just word

checkPalindrome :: String -> String -> String
checkPalindrome word1 word2 = 
    case (isWord word1) of
        Nothing -> "The first word is invalid"
        Just word1 -> case (isWord word2) of
            Nothing -> "The second word is invalid"
            Just word2 -> case (isPalindrome word1 word2) of
                False -> "These words are not palindromes"
                True -> "These words are palindromes"


substituteChar :: Char -> Char
substituteChar c = 
    case c of
        'e' -> '3'
        'i' -> '1'
        'o' -> '0'
        'a' -> '4'
        _ -> c


main :: IO()
main =
    do
        putStr "Please give me a word.\n"
        word1 <- getLine
        print(map substituteChar word1)