-- 1
e1_1 :: [[Integer]]
e1_1 = [[1,2],[3,4]]
e1_2 :: [[Int]]
e1_2 = [[1,2],[3,4]]
e1_3 :: Num a => [[a]]
e1_3 = [[1,2],[3,4]]

-- 2
e2_1 :: [[[Integer]]]
e2_1 = [[[1, 2, 3]], [[3, 4, 5]]]
e2_2 :: [[[Int]]]
e2_2 = [[[1, 2, 3]], [[3, 4, 5]]]
e2_3 :: Num a => [[[a]]]
e2_3 = [[[1, 2, 3]], [[3, 4, 5]]]

-- 3
e3 :: Num a => a -> a
e3 x = x * 2

-- 4
e4 :: (a, b) -> a
e4 (x, y) = x

-- 5
e5 :: (a, b, c) -> c
e5 (x, y, z) = z

-- 6
e6 :: Num a => a -> a -> a
e6 x y = x * y

-- 7
e7 :: (a,b) -> (b,a)
e7 (x, y) = (y, x)

-- 8
e8 :: a -> b -> (b, a)
e8 x y = (y, x)

-- 9
e9 :: [a] -> (a, Bool)
e9 [x, y] = (x, True)

-- 10
e10 :: (a, a) -> [a]
e10 (x, y) = [x, y]

-- 11
e11 :: (Char, Bool)
e11 = ('\a', True)

-- 12
e12 :: [(Char, Int)]
e12 = [('a', 1)]

-- 13
e13 :: Int -> Int -> Int
e13 x y = x + y * y

-- 14
e14 :: ([Char], [Float])
e14 = ("abc", [1.0])

-- 15
e15 :: [a] -> [b] -> (a, b)
e15 xs ys = (head xs, head ys)
