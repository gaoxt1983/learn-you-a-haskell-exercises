import Control.Applicative
import Data.Monoid

-- We can use the following type to simulate our own list
data List a = Empty | Value a (List a) deriving (Show)

-- Make the list a Functor

instance Functor List where
    fmap f (Value x y) = Value (f x) (fmap f y)
    fmap f Empty = Empty

-- Write a function which appends one list on to another
combineLists:: List a -> List a -> List a
combineLists Empty Empty = Empty
combineLists Empty other = other
combineLists other Empty = other
combineList (Value x y) other = Value x (combineLists y other)

-- Make our list a Monoid
instance Semigroup (List a) where
    (<>) = combineLists

instance Monoid (List a) where
    mempty = Empty

-- Make our list an Applicative

instance Applicative List where
    pure x = Value x Empty
    Empty <*> _ = Empty
    (Value f rest) <*> other = combineLists (fmap f other) (rest <*> other)

-- Make sure that the List obeys the laws for Applicative and Monoid

-- Create some lists of numbers of different lengths such as:
twoValueList = Value 10 $ Value 20 Empty

-- Use <$> on the lists with a single-parameter function, such as:
plusTwo = (+2)

value = plusTwo <$> Empty

-- Use <$> and <*> on the lists with a binary function

-- Create some lists of binary functions

value = Just (+) <*> Just (*) <*> Just 3
-- Use <*> on the binary functions list and the number lists
