-- This function should print a single digit number as English text, or "unknown" if it's out of the range 0-9
englishDigit :: Int -> String
englishDigit x = if x < 0 || x > 9 then "unknown" else show x

-- given a tuple, divide fst by snd, using pattern matching. 
-- it should return undefined for division by zero
divTuple :: (Eq a, Fractional a) => (a, a) -> a
divTuple (x, y) = if y == 0 then undefined else x / y

-- if the first three numbers in a list are all zero, return True
threeZeroList :: [Int] -> Bool
threeZeroList x = if length x < 3 then False else x1 == 0 && x2 == 0 && x3 == 0
    where x1:x2:x3:xs = x
