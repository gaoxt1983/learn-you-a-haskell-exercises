import System.Random
import System.Environment
import Data.List

{-
 - Lets implement the UNIX echo command
 - The program arguments are simply printed to the standard output.
 - If the first argument is -n, this argument is not printed, and no trailing newline is printed
 -}
  
main = do
    (_:arg1:xs) <- getArgs
    if arg1 == "-n" then
        putStr $ intercalate "" xs
    else
        putStrLn $ intercalate "" (arg1:xs)

{- Write a lottery number picker
 - This function should take a StdGen instance, and produce a list of six unique numbers between 1 and 49, in numerical order
 -}
lottery :: StdGen -> [Int]
lottery gen = sort $ take 6 $ randomRs (1, 49) gen :: [Int]
