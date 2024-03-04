+++
title = 'Advanced Unit Conversions'
date = 2024-03-03T14:33:59+09:00
draft = true
tags = ["math", "physics"]
math = true
+++

# Unit Conversions

1 meter = 100 millimeters = 3.281 feet = 39.37 inches.
This is an example of unit conversion.
Sometimes, unit conversion is used to convert quantities from an unfamiliar unit to a familiar one.
Currently, 1 US Dollar is equivalent to 151 Japanese Yen[^weakyen] [^ratecite].
At times, the change of unit is for clarity, to express quantities of large or small amounts into comprehensible numbers.
For instance, instead of several thousand steps, I find the unit of several miles[^us] more graspable.

While teaching as a graduate teaching assistant or during college tutoring, I observed that units tended to be an afterthought when answering science (and sometimes math) questions.
Unfortunately, the students I had the pleasure of grading sometimes received a lower letter grade because of missing units.
I also made this same mistake during my college years.
Perhaps the thinking is, "The units are obvious. Why should I bother with such tedious details?"
I remember thinking this on a few occasions[^unitmiss].
I have two objectives in this article: to convince the reader that units are important, and to expand on the concept of units and the power they hold.
If you are already convinced of the importance of units, feel free to skip to the [later section]({{< relref "#advanced" >}}).

# Why Units

Units are important.
If not for the pure usefulness,  the clarity of communication about observations and measurements of the nature world is critical in today's world of high precision.
Fundamentally, units act as a medium to relate quatities of a same value.
This is can readily be seen by a few examples.
Length, where to have the *same value*, two quantities must measure the same distance.
Time, where to have the *same value*, two quantities must measure the same duration.
Value, where to have the *same value*[^valuetwo], two quantities must be appraised to the same degree.

## They are Needed

For units like length and time, the use of units allows for math to be useful, instead of being locked away in some Platonic ideal.
For we let's take a length measurement of 6.18 meters = 6.18m.
We can decompose this measurement into two parts.
The numerical amount, 6.18.
The unit part, "meter".
When we make simulations, the numerical amount is what the computer understands.
But without the the unit part, we could be talking about radically different length scales, like megaparsecs[^extreme] instead of meters; this would definitely change our interpretation of the result.
For the sake of doing calculations as well, it's usually required of us to forego units do our calculators can handle the calculations.
But, I would also recommend that one reunites these parts as soon as one can, lest there be a regretable engineering disaster.

## They are Useful

Regardless of the importance of units, they are useful in conjunction with unit conversions.
Understanding units can help on understand unitful things more fundamentally.
Let's take for the example of cooking.
More likely than not, a particular recipe makes too much or too little.
With unit conversions we can understand how to adjust ingredients to an arbitrary number of portions. 

### Cooking Example 

Let's say that one recipe needs several ingredients of varying quantities of volume or mass.
Let's label the ingredients with numbers $1,2,3,4,\ldots$. 
Let's label the amount needed for the $i^{ th }$ ingredient as $x_i$.
So per 1 recipe we $x_i$ of each ingredient to make some $p$, proportions.
If we want for example, $w$, proportions, we can multiply each mentioned quantity by $w/p$.
So our proportions becomes $w$ where ${ p\rightarrow (w/p) p }$.
Likewise for our ingredient amounts become $(w/p) x_i$.
The important quatities here is $w/p$.
This quantity is unitless.
It represents the proportional increase or decrease in the amount of proportions.

Imagine you have a recipe that serves 4 people, but you need to adjust it to serve 6. This is where unit conversions come into play. 
By understanding the relationship between the units, you can scale the ingredients up or down to achieve the desired quantity. 
Here's how you can do it:

1. Identify the original number of servings ($p$), which in this case is 4.
1. Determine the desired number of servings ($w$), which is 6.
1. Calculate the conversion factor by dividing the desired servings by the original servings: $ w/p = 6/4 = 1.5 $.
1. Multiply each ingredient amount ($x_i$) by the conversion factor to get the new required amount for the adjusted recipe.

For example, if the original recipe calls for 2 cups of sugar for 4 servings, you would need $1.5 \times 2$ cups of sugar to make 6 servings, which equals 3 cups of sugar.

# Advanced Unit Conversions {#advanced}

For review, let's rememeber the rules of units.
And for simplicity, let's have a set of units that are just a single letter, like $a$.
These units are incommensurable.
You can always multiply two units units and divide them to get a new unit.
$ab$ and $a/b$ would be new units.
You can only add commensurable.
One might wonder why restrict to having one commensurable unit (one per letter)?
We could have included more commensurable units for say unit $a$.
For example, $a'$, but there is always a unitless number such that $x = a'/a$.
So in principle[^notpractical], we can express all sets of commensurable units with just one unit.

In short, for a set of incommensurable units $\\\{a,b,\ldots\\\}$ and numbers $s$ and $m$.

1. A real number, $s$, and unit, $a$, make a quantity, $sa$.
2. Any two quatities ($s a$ and $m b$) can be multiplied ($(sm) (ab)$) or divided ($(s/m) (a/b)$).
3. Two quantities are commensurable ($a$, $a'$) if their ratio is a unitless number.
4. Only commensurable quantities can be added (or subtracted).

Unit conversion is simply a definition of a new unit.
Let's say we have a new unit $a'$ commensurable with $a$.
We define it as $a'x/a = 1$ where $x$ is some arbitrary number.

## Unit Conversions as Transformations

We can solve for the aforementioned $a$ here such that we have $a = a' x$.
We can then express $a$ as a function of $a'$, $f(a') = a' x$.
This $f$ encodes the unit conversion.
Usually this $f$ has as an "inverse transformation", $f^{-1}$.
So $(f^{-1}\circ f)(a') = f^{-1}(f(a')) = a'$.
This inverse transformation does not necessarily have to be a mathematical inverse.

<!-- We would like this rule for transformations. -->
<!-- It's possible to have such transformations such that the resulting -->

### Money to the Future and Back

Let's take the example of investing money.
Let's say we have $f$ as the transformation that means the value of some principle after 30 years in todays money.

$$f(x) := x$$

This $f$ takes today money and converts it to future money, $f$ is trivial because money that moves into the future keeps its face value.
Now assuming an inflation rate of $i$, we have the inverse transformation $f^{-1}$.

$$f^{-1}(y) := y / (1+i)^{30}$$

Composing these transformations we have the amount the amount of money in todays cash if left for 30 years.

$$f^{-1}(f(x)) := x / (1+i)^{30} = x (1+i)^{-30}$$

I would argue that $f$ and $f^{-1}$ are unit conversions because they both are invertible functions.
We can express each transformations also as a definition of a new unit.
But, in the context of investing we naturally can transform money to the future dollars or from the furture dollars to present dollars with the transformations $f$ and $f^{-1}$ respectively.

We can see that the unit conversions can correspond to transformations.
This is more general to traditional unit conversions because sometimes the mathematical invere of the transformation is not available maybe due to the particular model's constraints.
In this case of money, money natural just sits around naturally while when looking in retrospect can be done by using historical interest rates.

## Generalizing Units (Addition/Subtraction)

Units can be multiplied and divided and add/subtract if commensurable.
Nevertheless, we can relax the 3rd condition.
I could have a quantity that takes the form like $1 m + 1 s$; this is read as 1 meter and 1 second.
If we limit the number of base commensurable units we could have a now algebra of units.
The elements of this algebra is countably inifinite[^guess] where it's elements take the form of linear sum of quantities of incommensurable units.
All of the unit incommensurable units would take the form of 
$$ \prod_i^N x_i^{ n_i }\\,.$$
$N$ is the number of base units.
$n_i$ is the power raised for the ith based unit, which could be any integer.
An interesting thing about such units is that we can not label each unit by a Nth order Cartesian product of integers!
So the space of incommensurable units is $\otimes^N \mathbb Z$.
Within this space it is acutally possible to do unit transformations as well.
A generalization of the scaling by number here would be to use a general linear transformation.
Let's say we have some scheme to represent quantities as a vector where the ith slot is mapped to mean the amount of the ith units.
For the quantity 0, this vector would be an infinitely long zero vector.
Let's call this quantity v.
Taking a linear transformation A, we can find the quantity expressed in new units as Av.
In a sense, the usual unit transformation is in this same class of linear transformations, but the main difference is that commensurable units are never mix.
So, A would be diagonal[^guess].
For example we could have $1 m + 2 s \equiv \langle 1, 2 \rangle = v$
We could have a unit transformation of 
$$A = \begin{bmatrix} 1 m/m & 1m/s \\\\ 0 & 1s/s \\ \end{bmatrix}$$.
The new quatity, in the new units would be $Av = 3 m + 2 s$.
The downside of these generalized units is that every vector is mappable to any other vector so all units essentially the same.
I could see this generalization being useful if there are retrictions on which transformations are allowed, so there are multiple disjoint sets of incommensurable units.

[^weakyen]: The Yen is weak compared to the dollar at the moment.
[^ratecite]: https://www.exchange-rates.org/ja/exchange-rate-history/usd-jpy-2024
[^us]: Or kilometers for these international audience
[^unitmiss]: This happend quite a bit first and second year of college.
[^valuetwo]: Please excuse the confusing word choice. The first value is like amount and the second value is like worth.
[^extreme]: Extreme example but even using kilometers compared to meters is enough 😜.
[^notpractical]: Not practically useful of course
[^guess]: I guess.
