-- 1

halve :: [a] -> ([a], [a])
halve xs = (take l xs, drop l xs)
           where l = div (length xs) 2

halve1 xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
  where n = length xs

halve2 xs = splitAt (div (length xs) 2) xs

halve3 xs = (take n xs, drop n xs)
  where n = length xs `div` 2


-- 2

-- a
safetail1 :: [a] -> [a]
safetail1 xs = if null xs then xs else tail xs

-- b
safetail2 :: [a] -> [a]
safetail2 xs | null xs = xs
             | otherwise = tail xs

-- c
safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 (_ : xs) = xs


-- 3

oar1 :: Bool -> Bool -> Bool
oar1 True True = True
oar1 True False = True
oar1 False True = True
oar1 False False = False

oar2 :: Bool -> Bool -> Bool
oar2 False False = False
oar2 _ _ = True

oar3 :: Bool -> Bool -> Bool
oar3 a b | a == b = False
         | otherwise = True


-- 4

and' :: Bool -> Bool -> Bool
and' x y = if x == y then True else False


-- 5

nd :: Bool -> Bool -> Bool
nd x y = if x then y else x


-- 6

mult' :: Int -> Int -> Int -> Int
mult' = \x -> \y -> \z -> x * y * z


-- 7, from website

remove :: Int -> [a] -> [a]
remove n xs = take n xs ++ drop (n + 1) xs
--remove 0 [1,2,3,4] = [2,3,4]


-- 8, from website

funct :: Int -> [a] -> [a]
funct x xs = take (x + 1) xs ++ drop x xs
-- funct 3 [1,2,3,4,5,6,7] = [1,2,3,4,4,5,6,7]
