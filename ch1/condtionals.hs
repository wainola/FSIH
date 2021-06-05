function :: Integer -> Integer -> Integer
function x y = if (x > y) then (x * 10) else y

function2 :: Integer -> Integer -> Integer
function2 x y = 
    case (x > y) of 
        False -> y
        True -> x * 10

absVal :: (Num a, Ord a) => a -> a
absVal x = if (x < 0) then (negate x) else x

absVal2 :: (Num a, Ord a) => a -> a
absVal2 x = 
    case (x < 0) of
        False -> x
        True -> (negate x)

validateUsernamePassword :: String -> String -> String
validateUsernamePassword username password = 
    if null username
        then (if null password
            then "Empty username and password"
            else "Empty username")
        else (if null password
            then "Empty password"
            else "Okay")

validateUsernamePassword2 :: String -> String -> String
validateUsernamePassword2 username password =
    case null username of
        False -> (case null password of
            False -> "Okay"
            True -> "Empty password")
        True -> (case null password of
            False -> "Empty username"
            True -> "Empty username and password")

safeHead :: [a] -> a
safeHead [] = error "empty list"
safeHead (x:xs) = x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeHead2 :: [a] -> Maybe a
safeHead2 [] = Nothing
safeHead2 (x:xs) = Just x