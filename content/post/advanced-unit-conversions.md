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
Beyond their sheer usefulness, the clarity of communication about observations and measurements of the natural world is critical in today's era of high precision.
Fundamentally, units act as a medium to relate quantities of the same value.
This can readily be seen through a few examples:
- **Length**: For two quantities to have the *same value*, they must measure the same distance.
- **Time**: For two quantities to have the *same value*, they must measure the same duration.
- **Value**: For two quantities to have the *same value*[^valuetwo], they must be appraised to the same degree.

## They are Needed

For units like length and time, the use of units allows mathematics to be practical, rather than being locked away in some Platonic ideal.
Let's take a length measurement of 6.18 meters, or 6.18m.
We can decompose this measurement into two parts:
- The numerical amount, 6.18.
- The unit part, "meter".

In simulations, the numerical amount is what the computer understands.
But without the unit part, we could be discussing radically different length scales, such as megaparsecs[^extreme] instead of meters, which would definitely change our interpretation of the results.
For the sake of calculations, it's usually required of us to temporarily forego units so our calculators can handle the computations.
However, I would recommend that one reunites these parts as soon as possible, lest there be a regrettable engineering disaster.

## They are Useful

Regardless of the importance of units, they are useful in conjunction with unit conversions.
Understanding units can help one understand unitful concepts more fundamentally.
Consider cooking as an example.
More often than not, a particular recipe makes too much or too little.
With unit conversions, we can adjust ingredients to an arbitrary number of portions.

### Cooking Example

Suppose a recipe requires several ingredients in varying quantities of volume or mass.
We'll label the ingredients with numbers $1, 2, 3, 4, \ldots$.
The amount needed for the $i^{th}$ ingredient is $x_i$.
For one recipe, we need $x_i$ of each ingredient to make some $p$ portions.
If we want, for example, $w$ portions, we can multiply each mentioned quantity by $w/p$.
Our portions become $w$, where ${ p\rightarrow (w/p) p }$.
Likewise, our ingredient amounts become $(w/p) x_i$.
The important quantity here is $w/p$.
This ratio is unitless and represents the proportional increase or decrease in the number of portions.

Imagine you have a recipe that serves 4 people, but you need to adjust it to serve 6. This is where unit conversions come into play.
By understanding the relationship between the units, you can scale the ingredients up or down to achieve the desired quantity.
Here's how you can do it:

1. Identify the original number of servings ($p$), which in this case is 4.
2. Determine the desired number of servings ($w$), which is 6.
3. Calculate the conversion factor by dividing the desired servings by the original servings: $ w/p = 6/4 = 1.5 $.
4. Multiply each ingredient amount ($x_i$) by the conversion factor to get the new required amount for the adjusted recipe.

For example, if the original recipe calls for 2 cups of sugar for 4 servings, you would need $1.5 \times 2$ cups of sugar to make 6 servings, which equals 3 cups of sugar.

# Advanced Unit Conversions {#advanced}

For review, let's remember the rules of units.
For simplicity, let's consider a set of units that are represented by a single letter, like $a$.
These units are incommensurable.
You can always multiply or divide two units to get a new unit, such as $ab$ or $a/b$.
You can only add or subtract commensurable units.
One might wonder why we restrict ourselves to one commensurable unit per letter.
We could have included more commensurable units for, say, unit $a$, like $a'$, but there is always a unitless number such that $x = a'/a$.
So, in principle[^notpractical], we can express all sets of commensurable units with just one unit.

In short, for a set of incommensurable units $\{a, b, \ldots\}$ and numbers $s$ and $m$:

1. A real number, $s$, combined with a unit, $a$, makes a quantity, $sa$.
2. Any two quantities ($s a$ and $m b$) can be multiplied ($(sm) (ab)$) or divided ($(s/m) (a/b)$).
3. Two quantities are commensurable ($a$, $a'$) if their ratio is a unitless number.
4. Only commensurable quantities can be added (or subtracted).

Unit conversion is simply the definition of a new unit.
Let's say we have a new unit $a'$ commensurable with $a$.
We define it as $a'x/a = 1$, where $x$ is some arbitrary number.

## Unit Conversions as Transformations

We can solve for $a$ such that we have $a = a'x$.
We can then express $a$ as a function of $a'$, $f(a') = a'x$.
This function $f$ encodes the unit conversion.
Usually, this function $f$ has an "inverse transformation," $f^{-1}$.
So, $(f^{-1}\circ f)(a') = f^{-1}(f(a')) = a'$.
This inverse transformation does not necessarily have to be a mathematical inverse.

### Money to the Future and Back

Consider the example of investing money.
Let $f$ be the transformation that represents the value of some principal after 30 years in today's money.

$$f(x) := x$$

This function $f$ takes today's money and converts it to future money. $f$ is trivial because money that moves into the future retains its face value.
Now, assuming an inflation rate of $i$, we have the inverse transformation $f^{-1}$.

$$f^{-1}(y) := y / (1+i)^{30}$$

Composing these transformations, we have the amount of money in today's cash if left for 30 years.

$$f^{-1}(f(x)) := x / (1+i)^{30} = x (1+i)^{-30}$$

I would argue that $f$ and $f^{-1}$ are unit conversions because they are both invertible functions.
We can express each transformation also as the definition of a new unit.
But, in the context of investing, we naturally transform money to future dollars or from future dollars to present dollars with the transformations $f$ and $f^{-1}$, respectively.

We can see that unit conversions can correspond to transformations.
This is more general than traditional unit conversions because sometimes the mathematical inverse of the transformation is not available, perhaps due to the particular model's constraints.
In the case of money, money naturally just sits around, while looking in retrospect can be done by using historical interest rates.

## Generalizing Units (Addition/Subtraction)

Units can be multiplied, divided, and added or subtracted if they are commensurable.
However, we can relax the third condition.
Imagine a quantity that takes the form of $1 m + 1 s$; this is read as 1 meter plus 1 second.
If we limit the number of base commensurable units, we could create a new algebra of units.
The elements of this algebra are countably infinite[^guess], where its elements take the form of a linear sum of quantities of incommensurable units.
All of the incommensurable units would take the form of 
$$ \prod_i^N x_i^{ n_i }\\,.$$
Here, $N$ is the number of base units, and $n_i$ is the power raised for the $i^{th}$ base unit, which could be any integer.
An interesting aspect of such units is that we can label each unit by an $N^{th}$ order Cartesian product of integers!
So, the space of incommensurable units is $\otimes^N \mathbb{Z}$.
Within this space, it is actually possible to perform unit transformations as well.
A generalization of scaling by a number here would be to use a general linear transformation.
Suppose we have some scheme to represent quantities as a vector, where the $i^{th}$ slot corresponds to the amount of the $i^{th}$ unit.
For the quantity zero, this vector would be an infinitely long zero vector.
Let's call this quantity $v$.
Taking a linear transformation $A$, we can find the quantity expressed in new units as $Av$.
In a sense, the usual unit transformation is in this same class of linear transformations, but the main difference is that commensurable units are never mixed.
Thus, $A$ would be diagonal[^guess].
For example, we could have $1 m + 2 s \equiv \langle 1, 2 \rangle = v$.
A unit transformation could be represented as 
$$A = \begin{bmatrix} 1 m/m & 1 m/s \\\\ 0 & 1 s/s \end{bmatrix}$$.
The new quantity, in the new units, would be $Av = 3 m + 2 s$.
The downside of these generalized units is that every vector is mappable to any other vector, so all units are essentially the same.
This generalization could be useful if there are restrictions on which transformations are allowed, resulting in multiple disjoint sets of incommensurable units.

[^weakyen]: The Yen is weak compared to the dollar at the moment.
[^ratecite]: https://www.exchange-rates.org/ja/exchange-rate-history/usd-jpy-2024
[^us]: Or kilometers for these international audience
[^unitmiss]: This happend quite a bit first and second year of college.
[^valuetwo]: Please excuse the confusing word choice. The first value is like amount and the second value is like worth.
[^extreme]: Extreme example but even using kilometers compared to meters is enough 😜.
[^notpractical]: Not practically useful of course
[^guess]: I guess.
