data Shape = Circle Float Float Float | Rectangle Point Point deriving (Show)

data Point = Point Float Float deriving (Show)

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

data Person = Person String String Int Float String String deriving (Show)

firstName :: Person -> String
firstName (Person firstName _ _ _ _ _) = firstName

lastName :: Person -> String
lastName (Person _ lastname _ _ _ _) = lastname

data Person1 = Person1
  { firstname :: String,
    lastname :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
  }
  deriving (Show)

data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)

p1 = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

car = Car {company = "Ford", model = "Focus", year = 2015}

data Car1 a b c = Car1
  { company1 :: a,
    model1 :: b,
    year1 :: c
  }
  deriving (Show)

main :: IO ()
main = do
  print (surface $ Circle 10 20 10)
  print (surface $ Rectangle (Point 0 0) (Point 100 100))
  print (p1)