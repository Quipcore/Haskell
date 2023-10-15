module Main where

main :: IO ()
main = do
    let min = 10
        max = 20
        n = 15
    putStrLn ("Min: "++ show min ++ "\t\tMax: " ++ show max ++ "\t\tList:" ++ show (createList min max))
    putStrLn ("[" ++ show min ++ ".." ++ show max ++"] contains " ++ show n ++ " => " ++ show (contains (createList min max) n))
    putStrLn (show (createDupList min max) ++ " =>/remove dups/=> " ++ show (removeDuplicates(createDupList min max)))
    putStrLn (show (isAscending(removeDuplicates(createDupList min max))))
    putStrLn (show (hasPath [(1,2),(2,3)] 1 3))
    putStrLn (show (fac 5))


fac :: Int -> Int
fac n
    | n <= 1    = 1
    | otherwise = n * fac (n-1)

createDupList :: Int -> Int -> [Int]
createDupList min max = (createList min max) ++ (createList min max)

createList :: Int -> Int -> [Int]
createList min max
    | min > max = []
    | min == max = [max]
    | min < max = min : createList (min+1) max
-- equvilent with createList min max = [min..max]

contains :: [Int] -> Int -> Bool
contains [] _ = False
contains (x:xs) num
    | num == x = True
    | otherwise = contains xs num

removeDuplicates :: [Int] -> [Int]
removeDuplicates [] = []
removeDuplicates (x:xs) 
    | contains xs x = removeDuplicates xs
    | otherwise     = x : removeDuplicates xs

isAscending :: [Int] -> Bool
isAscending [] = True
isAscending [x] = True
isAscending (x:y:xs)
    | x < y = isAscending (y:xs)
    | otherwise = False

hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] x y = x==y
hasPath xs x y
    | x == y = True
    | otherwise =
        let xs' = [(n,m) | (n,m) <- xs, n /= x] in or [hasPath xs' m y | (n,m) <- xs, n == x]
