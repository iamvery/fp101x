import Data.Char
import Control.Monad (unless)

assert :: Bool -> String -> IO ()
assert p str = unless p (error str)

-- 1
s = sum [x ^ 2 | x <- [1..100]]
-- 338350


-- 2
replicate' :: Int -> a -> [a]
replicate' n a = [a | _ <- [1..n]]

-- 3
pyths :: Int -> [(Int, Int, Int)]
pyths l = [(x,y,z) | x <- [1..l],
                     y <- [1..l],
                     z <- [1..l],
                     x ^ 2 + y ^ 2 == z ^ 2]

-- 4
factors :: Int -> [Int]
factors n = [x | x <- [1..n], mod n x == 0]

perfect :: Int -> [Int]
perfect l = [n | n <- [1..l], sum (init (factors n)) == n]

-- 5
pairs = [(x,y) | x <- [1,2,3], y <- [4,5,6]]

pairs' = concat [[(x,y) | x <- [1,2,3]] | y <- [4,5,6]]
-- http://img.pandawhale.com/post-28553-Steve-Jobs-mind-blown-gif-HD-T-pVbd.gif

-- 6
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x',i) <- zip xs [0..n], x == x']
                 where n = length xs - 1

find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']

positions' :: Eq a => a -> [a] -> [Int]
positions' x xs = find x (zip xs [0..n])
                  where n = length xs - 1

-- 7
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x,y) <- zip xs ys]

-- 8
llet2int :: Char -> Int
llet2int c = ord c - ord 'a'
int2llet :: Int -> Char
int2llet n = chr (ord 'a' + n)
ulet2int :: Char -> Int
ulet2int c = ord c - ord 'A'
int2ulet :: Int -> Char
int2ulet n = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2llet (mod (llet2int c + n) 26)
          | isUpper c = int2ulet (mod (ulet2int c + n) 26)
          | otherwise = c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- hw8
e8 = [(x, y) | x <- [1, 2], y <- [1, 2]]

-- hw9
e9 = [x | x <- [1, 2, 3], y <- [1..x]]

-- hw10
e10 = sum [x | x <- [1..10], even x]

-- hw11
xs = 1 : [x + 1 | x <- xs] -- wat?

-- hw12
riffle :: [a] -> [a] -> [a]
riffle xs ys = concat [[x,y] | (x,y) <- zip xs ys]

-- hw13
divides :: Int -> Int -> Bool
divides x y = mod x y == 0

divisors :: Int -> [Int]
divisors x = [d | d <- [1..x], divides x d]


-- check
main = do
  assert (s == 338350) "#1 is wrong"
  assert ((replicate' 3 'a') == "aaa") "#2 is wrong"
  assert ((pyths 5) == [(3,4,5),(4,3,5)]) "#3 is wrong"
  assert ((perfect 500) == [6,28,496]) "#4 is wrong"
  assert (e8 == [(1,1),(1,2),(2,1),(2,2)]) "#8 is wrong"
  assert (e9 == [1,2,2,3,3,3]) "#9 is wrong"
  assert (e10 == 30) "#10 is wrong"
  assert ((riffle [1,2,3] [4,5,6]) == [1,4,2,5,3,6]) "#12 is wrong"
  assert ((divides 15 2) == False) "#13 is wrong"
  assert ((divides 15 3) == True) "#13 is wrong"
  assert ((divisors 15) == [1, 3, 5, 15]) "#13 is wrong"
