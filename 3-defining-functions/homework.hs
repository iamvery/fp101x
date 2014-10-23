-- 1

halve :: [a] -> ([a], [a])
halve xs = (take l xs, drop l xs)
           where l = div (length xs) 2


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
