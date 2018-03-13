Exercise A
----------

It can be equal to either, depending on order of evaluation (precedence) of operators.

Exercise B
----------

[0,1) --> Not syntactically correct; mismatched parentheses/brackets.

double -3 --> This is equivalent to (double) - (3) and so doesn't have a sensible type because 'double' takes a Num, and (-) is a function, not a Num.

double (-3) --> This is well-formed and evaluates to '-6' as expected. The parentheses cause the '-3' to be evaluated first.

double double 0 --> Function application is left-associative, so this equivalent to (double double) 0, which doesn't have a sensible type once again because double is expecting a Num, and double itself (the input here) is a function.

if 1==0 then 2==1 --> This is missing an 'else' clause, otherwise it would be well-formed and always evaluate to whatever was contained within the 'else' block.

"++" == "+" ++ "+" --> This is well-formed, and evaluates to 'True'.

[(+),(-)] --> This is well-formed, but can't be shown because there is no instance for 'Show' for the functions '+' and '-' defined.

[[],[[]], [[[]]]] --> This is well-formed and has type [[[[a]]]]

concat ["tea","for",'2'] --> This is well-formed, but can't be evaluated because it doesn't have a sensible type. 'concat' accepts an 'homogenous' array of elements, and the last element here is not the same type as the others. Namely they are, [Char] / String and Char.

concat ["tea","for","2"] --> This is well-formed, and has type String.

Exercise C
----------

1. 'toUpper'

2. It converts each element of an array into a string and concatenates the result, placing spaces between each element.

Only the first equation holds. Because 'words' doesn't distinguish between different types of whitespace (e.g. spaces and tabs, or even different lengths of repeated spaces), this information is lost and so when 'unwords' concatenates them back into a string, the resulting string may not be the same as the original one.

3. The original list would be the concatenation of the head and the tail as arrays: '[x] ++ xs'.

> modernise :: String -> String
> modernise xs = unwords . map firstLetterCapital . words
>
> firstLetterCapital :: String -> String
> firstLetterCapital xs = [toUpper (head xs)] ++ tail xs

Exercise D
----------

Beaver would evaluate f n times, and Susan would evaluate it just once.

As an alternative to 'head . map f', Beaver would prefer 'f . head'

Beaver wouldn't want to use 'head . filter p' because he would have to evaluate p for every element of the list, regardless of whether it has returned 'True' or not.

First line: '| p x = x'

Second line: '| otherwise = first p (tail xs)'

Beaver would prefer something like 'first (p . f)'

Exercise E
----------

Six functions :: Maybe a -> Maybe a

Exercise F
----------
It would take n-1 multiplications to evaluate 'exp x n'.

First line: '| even n = exp (x * x) (n `div` 2)

Second line: '| odd n = x * exp (x * x) ((n `div` 2) - 1)

It would take p multiplications to evaluate 'exp x n' using this method.

Exercise G
----------

> data Date
> showDate :: Date -> String
> showDate (d,m,y) = stringDate (ordinate d) (numToMonth m) (show y)
>
> stringDate :: String -> String -> String -> String
> stringDate d m y = d ++ " " ++ m ++ ", " ++ y
>
> ordinate :: Integral a => a -> String
> ordinate xs | last n == "2" = n ++ "nd"
              | last n == "3" = n ++ "rd"
              | otherwise = n ++ "st"
              | where n = show xs
>
> numToMonth :: Integral a => a -> String
> numToMonth x = months!!(x-1)
>
> months = ["January","February","March","April","May","June","July","August","September","October","November","December"]

Exercise H
----------

> addSum :: CIN -> CIN
> addSum xs = xs ++ checksum xs
>
> checksum :: CIN -> CIN
> checksum xs = show (sum map getDigit xs)
>
> getDigit :: Char -> Int
> getDigit c = read [c]

> valid :: CIN -> Bool
> valid xs = drop 8 xs == checksum xs

Exercise I
----------

> palindrome :: IO ()
> palidrome xs = do {putStrLn "Enter a string:";
>                    inStr <- getLine;
>                    if pal . clean . toLower xs then putStrLn "Yes!" else putStrLn "No!"}
>
> clean :: String -> String
> clean xs = concat . words xs
>
> pal :: String -> Bool
> pal xs | null xs = True
>        | length xs == 1 = True
>        | otherwise = head xs == last xs && pal . reverse . tail . reverse (tail xs)