-- 1

list_of_chars :: [Char]
list_of_chars = ['a', 'b', 'c']

string :: String
string = ['a', 'b', 'c']

list_of_tuples :: [(Bool, Char)]
list_of_tuples = [(False, '0'), (True, '1')]

tuple_of_lists :: ([Bool], [Char])
tuple_of_lists = ([False, True], ['0', '1'])

list_of_funcs :: [[a] -> [a]]
list_of_funcs = [tail, init, reverse]


-- 2

second :: [a] -> a
second xs = head (tail xs)

swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)

pair :: a -> b -> (a,b)
pair x y = (x,y)

double :: Num a => a -> a
double x = x * 2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)


-- 3
-- see above


-- 4
-- The set of all inputs and outputs for computable functions is too large
-- to define. These functions are undecidable. Functions that are referentially
-- transparent and decidable may be equal.

foo :: Int -> (Int -> Int)
foo x y = x + y
-- equivalent implemention of above without currying
foo' :: Int -> (Int -> Int)
foo' x = \y -> x + y
