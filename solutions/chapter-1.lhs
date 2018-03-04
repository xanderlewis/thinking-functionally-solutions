Exercise A
----------

1) map double [1,4,4,3] evaluates to: [2,8,8,6]

2) map (double . double) [1,4,4,3] evaluates to: [4,16,16,12]

3) map double [] evaluates to: []

4)

a)

sum . map double = double . sum

Since function application takes precendence over function composition, this is equivalent to stating that sum . (map double) = double . (sum).

In other words, if you double each number in a list of numbers and then find their sum, that is equivalent to finding their sum and then doubling that result.

This is true because multiplication is distributive over addition.

Symbolically: 2a + 2b + ... = 2(a + b + ...)

b)

sum . map sum = sum . concat

As before, this is equivalent to: sum . (map sum) = sum . concat

This is true, because 'map sum' will take an array and return a new array where each element is the sum of each element of the input array.

When the input array is an array of arrays, 'map sum' will behave just like 'concat' because the sum of [a] is just a.

On both sides, sum is then applied to the results of the two things we have decided are equivalent, so the whole equation is true.

c)

sum . sort = sum

This is true because addition is associative. We can change the order of the summands all we want, and not affect the sum.

Exercise B
----------

sin theta^2 or (sin theta)^2 are both correct renderings because function application takes precedence over exponentiation.

sin (2 * theta) / (2 * pi) would be the correct rendering of sin2θ/2π

Exercise C
----------

'H' has type Char, whereas "H" has type [Char] (also known as String).

2001 has type Integer and so is treated as a number, wheras "2001" has type [Char] and so is treated as a string.

[1,2,3] ++ [3,2,1] = [1,2,3,3,2,1]

"Hello" ++ " World!" = "Hello World!"

[1,2,3] ++ [] = [1,2,3]

"Hello" ++ "" ++ "World!" = "HelloWorld!"

Exercise D
----------

First method:

words . map toLower

Second method:

map (map toLower) . words

Exercise E
----------

Numerical addition is associative.

(a + b) + c = a + (b + c)

List concatenation is associative.

([a,b,c] ++ [a,b,c]) ++ [a,b,c] = [a,b,c] ++ ([a,b,c] ++ [a,b,c])

Functional composition is not associative.

(f . g) . h ≠ f . (g . h)

A clearer counterexample: 2sin(3a) is not equivalent to 3sin(2a).

Exponentiation is not associative.

(a^b)^c ≠ a^(b^c)

The identity element for addition is 0.

For concatenation, it is [].

For composition, it is an 'empty' function. (f x = x) P.S.: In the answers, this is referred to as the 'identity function', which makes more sense.

Exercise F
----------

I could first define a function called which would take an array of words and an integer word length and return an array containing just the words of length n.
extractNLengths :: [Word] -> Int -> [Word]

I could also define a function that sorts the letters of a word into alphabetical order.
sortLetters :: Word -> Word

...and a function that sorts an array of words into alphabetical order.
sortWords :: [Word] -> [Word]

(These two functions could possibly be defined once in a more general function)

A function that takes an array of words and returns an array of pairs of words in their ordered and original forms would also be useful. This function would make use of the previously defined sortLetters and sortWords. sortLetters would be applied to every element of the array of words using map.
splitIntoPairs :: [Word] -> [[Word]]

I could also define a function to take an array of word pairs and return a new array of pairs where any pairs with the same ordered form are combined into one pair.
combinePairs :: [[Word]] -> [[Word]]

I could then define a function to render the final string output. It could take an array of word pairs and return a neatly formatted string representation ready for output.
renderPairs :: [[Word]] -> String

The final 'main' function could then be defined. It would take an integer length and an array of words and call the other functions to extract only n-length letters, split them into pairs of ordered and original words, and then render a nice string from the whole thing.
anagrams :: Int -> [Word] -> String


Exercise G
----------

> song n = if n==0 then ""
>    else song (n-1) ++ "\n" ++ verse n
>
> verse n = line1 n ++ line2 ++ line3 n ++ line4
>
> line1 n = if n==1 then "one man went to mow\n"
>    else numSpelling n ++ " men went to mow\n"
>
> line2 = "went to mow a meadow\n"
>
> line3 n = if n==1 then "one man and his dog\n"
>    else numSpelling n ++ " men, " ++ line3 (n-1)
>
> line4 = line2
>
> numSpelling n = ["one","two","three","four","five","six","seven","eight","nine"]!!(n-1)

I decided to do this in all lowercase because I'm lazy. Making each line start with a capital letter wouldn't be too hard.