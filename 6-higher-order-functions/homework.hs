import Prelude hiding (all, any, takeWhile, dropWhile, map, filter, curry, uncurry)
import Control.Monad (unless)

assert :: Bool -> String -> IO ()
assert p str = unless p (error str)

-- 1
cmp f p xs = [f x | x <- xs, p x]
cmp' f p xs = map f (filter p xs)

-- 2
all p xs = and (map p xs)
any p xs = or (map p xs)
takeWhile _ [] = []
takeWhile p (x : xs)
  | p x = x : takeWhile p xs
  | otherwise = []
dropWhile _ [] = []
dropWhile p (x : xs)
  | p x = dropWhile p xs
  | otherwise = x : xs

-- 3
map f = foldr (\x xs -> (f x) : xs) []
filter p = foldr (\x xs -> if p x then x : xs else xs) []

-- 4
dec2int :: [Int] -> Int
dec2int = foldl (\v x -> v * 10 + x) 0
-- dec2int [1,2,3]
-- f 0 [1,2,3]
-- f (0 * 10 + 1) [2,3]
-- f 1 [2,3]
-- f (1 * 10 + 2) [3]
-- f 12 [3]
-- f (12 * 10 + 3) []
-- f 123 []
-- 123

-- 5
sumsqreven = sum . map (^2) . filter even
-- there is no compose function(?)

-- 6
add :: Int -> Int -> Int
add a b = a + b
addp :: (Int, Int) -> Int
addp (a,b) = a + b

curry :: ((a,b) -> c) -> (a -> b -> c)
curry f = (\a -> (\b -> f (a,b)))

uncurry :: (a -> b -> c) -> ((a,b) -> c)
uncurry f = (\(a,b) -> f a b)

-- check
main = do
  assert ((cmp (*2) even [1,2]) == [4]) "#1 is wrong"
  assert ((cmp' (*2) even [1,2]) == [4]) "#1 is wrong"
  assert (not (all even [1,2,3])) "#2, all is wrong"
  assert (all even [2,4]) "#2, all is wrong"
  assert (not (any even [1,3])) "#2, any is wrong"
  assert (any even [1,2]) "#2, any is wrong"
  assert ((takeWhile even [2,4,5,6]) == [2,4]) "#2, takeWhile is wrong"
  assert ((dropWhile even [2,4,5,6]) == [5,6]) "#2, dropWhile is wrong"
  assert ((map (*2) [2,4]) == [4,8]) "#3, map is wrong"
  assert ((filter even [1,2,3]) == [2]) "#3, filter is wrong"
  assert ((dec2int [2,3,4,5]) == 2345) "#4 is wrong"
  assert ((add 2 3) == 5) "#6, add is wrong"
  assert ((addp (2,3)) == 5) "#6, addp is wrong"
  assert (((curry addp) 2 3) == 5) "#6, curry is wrong"
  assert (((uncurry add) (2,3)) == 5) "#6, uncurry is wrong"
