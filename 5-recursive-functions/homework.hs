import Prelude hiding ((^), (*), and, concat, replicate, (!!), elem, sum, take, last)
import Control.Monad (unless)

assert :: Bool -> String -> IO ()
assert p str = unless p (error str)

-- 1
(*) :: Int -> Int -> Int
m * 0 = 0
m * n = m + (m * (n - 1))

(^) :: Int -> Int -> Int
m ^ 0 = 1
m ^ n = m * (m ^ (n - 1))
-- 2 ^ 3
-- 2 * (2 ^ 2)
-- 2 * 2 * (2 ^ 1)
-- 2 * 2 * 2 * (2 ^ 0)
-- 2 * 2 * 2 * 1
-- 4 * 2 * 1
-- 8 * 1
-- 8

-- 2
-- length [1,2,3]
-- 1 + length [2,3]
-- 1 + 1 + length [3]
-- 1 + 1 + 1 + length []
-- 1 + 1 + 1 + 0
-- 2 + 1 + 0
-- 3 + 0
-- 3
-- drop 3 [1,2,3,4,5]
-- drop 2 [2,3,4,5]
-- drop 1 [3,4,5]
-- drop 0 [4,5]
-- [4,5]
-- init [1,2,3]
-- 1 : init [2,3]
-- 1 : 2 : init [3]
-- 1 : 2 : []
-- [1,2]

-- 3
and :: [Bool] -> Bool
and (True : []) = True
and (False : _) = False
and (_ : bs) = and bs

concat :: [[a]] -> [a]
concat [] = []
concat (a : as) = a ++ concat as

replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n a = a : replicate (n - 1) a

(!!) :: [a] -> Int -> a
(x : _) !! 0 = x
(_ : xs) !! n = xs !! (n - 1)

elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem x (y : ys) = x == y || elem x ys

-- 4
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x : xs) (y : ys) | x > y = y : merge (x : xs) ys
                        | otherwise = x : merge xs (y : ys)

-- 5
halve :: [a] -> ([a],[a])
halve xs = (take h xs, drop h xs)
  where h = div (length xs) 2

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort (fst h)) (msort (snd h))
  where h = halve xs

-- 6
sum :: Num a => [a] -> a
sum [] = 0
sum (x : xs) = x + sum xs

take :: Int -> [a] -> [a]
take 0 _ = []
take n (x : xs) = x : take (n - 1) xs

last :: [a] -> a
last [x] = x
last (_ : xs) = last xs

-- check
main = do
  assert (2^0 == 1 && 2^3 == 8) "#1 is wrong"
  assert ((and [True, False, True]) == False) "#3 is wrong"
  assert (and [True, True, True]) "#3 is wrong"
  assert ((concat [[1,2],[3,4]]) == [1,2,3,4]) "#3 is wrong"
  assert ((replicate 2 'a') == "aa") "#3 is wrong"
  assert (([1,2,3] !! 1) == 2) "#3 is wrong"
  assert (elem 'b' "abc") "#3 is wrong"
  assert ((elem 'd' "abc") == False) "#3 is wrong"
  assert ((merge [2,5,6] [1,3,4]) == [1,2,3,4,5,6]) "#4 is wrong"
  assert ((halve "abc") == ("a","bc")) "#5 is wrong"
  assert ((msort [5,2,6,3,1,4]) == [1,2,3,4,5,6]) "#5 is wrong"
  assert ((sum [1,2,3]) == 6) "#6 is wrong"
  assert ((take 2 [1,2,3]) == [1,2]) "#6 is wrong"
  assert ((last [1,2,3]) == 3) "#6 is wrong"
