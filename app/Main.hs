module Main where

--import Data.List --the Haskell stdlib for lists

--Exercises and videos from https://www.youtube.com/@philipphagenlocher Haskell for Imperative Programmer series

main :: IO ()
main = do
    putStrLn (show (fac 6))
    putStrLn (show (factorial 6))
    putStrLn (show (summationPlus 1 2))
    putStrLn (show (ascendingList 1 3))
    putStrLn (show (elementIn 3 [1..3]))
    putStrLn (show (removeDuplicates [1,2,1]))

-- Factorial
fac :: Int -> Int
fac n
    | n <= 1 = 1
    | otherwise = n * fac(n-1)

-- Pattern matching
is_zero 0 = True
is_zero _ = False

-- Factorial with accumulator
factorial n = aux n 1
    where
        aux n acc
            | n <= 1 = acc
            | otherwise = aux (n-1) (n*acc)

-- Experimentation with accumulator and aux functions
summationPlus a b = (aux1 a 1) + (aux2 b 1) --Sum of function1, function2 and 2
    where
        aux1 n acc = n + acc --Function 1
        aux2 n acc = n + acc --Function 2

--Lists
--Generate an ascending list, the same as [min..max]
ascendingList :: Int -> Int -> [Int]
ascendingList firstValue lastValue
    | lastValue < firstValue = []
    | lastValue == firstValue = [lastValue]
    | lastValue > firstValue = firstValue : ascendingList (firstValue+1) lastValue --Append n to the result of the recursive call "asc (n+1) m"

--Exercise #5.1, same as elem
elementIn :: (Eq a) => a -> [a] -> Bool --(Eq a) signals that all a's has to have the same type. It's a type class
elementIn e (x:xs)
    | (x:xs) == [] = False
    | e == x = True
    | otherwise = elementIn e xs

-- Solution #5.1
elementInSolution :: (Eq a) => a -> [a] -> Bool
elementInSolution _ [] = False
elementInSolution e (x:xs) = (e == x) || (elementInSolution e xs)

-- Exercise #5.2, same as nub
removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs)
    | elem x xs = removeDuplicates xs
    | otherwise = x : removeDuplicates xs

-- Solution
removeDuplicatesSolution :: (Eq a) => [a] -> [a]
removeDuplicatesSolution [] = []
removeDuplicatesSolution (x:xs)
    | x `elem` xs = removeDuplicatesSolution xs --More or less the same, just different way of calling elem
    | otherwise = x : removeDuplicatesSolution xs