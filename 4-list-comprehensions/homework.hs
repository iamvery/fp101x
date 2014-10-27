import Data.Char

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
