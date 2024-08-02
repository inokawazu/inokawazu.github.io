+++
title = 'Understanding Covectors'
date = 2024-07-18T08:57:02+09:00
draft = true
math = true
tags = ["physics", "math"]
+++

The amount of apples can be represented by a number $1,2,3\ldots$.
The length and time can also be represented by decimal/real numbers $1.3, \pi, 3,\ldots$.
The phase of an electric circuit can be represented by complex numbers!
In this sense physics useful by abstracting away our world into the world of math.
Beyond numbers another mathematical object is used to represent things like velocity and position.
This is the humble vector, an object with both magnitude and direction.
Classicaly, a vector is *represented* by an arrow ↗.
The length of the arrow from head to tail is the magnitude of the vector.
The direction is of course, the direction.

Though vectors can be said to have an *evil twin* --- covectors.
Can covectors also be represented as arrows?
What can covectors covectors represent anyways?
As an undergraduate student, covectors had always perplexed me, so I hope I can help those who are like what I was to help them in their mathematical journey.

# Understanding Vector

Before we can understand covectors, I think it is important to properly understand vectors first!
A vector is an object of magnitude and direction that can be written as a tuple of numbers $\vec x = (x^1,x^2,x^3)$.
Two vectors can added (connecting the tail to head) so $\vec x + \vec y = (x^1 + y^1, x^2 + y^2, x^3 + y^3)$ where  $\vec y = (y^1,y^2,y^3)$.
Vectors can be scaled too where for a number $c$ we can make another vector $c x = (c x^1,c x^2,c x^3)$
Because of this vectors can be decomposed, $\vec x = (x^1,0,0) + (0,x^2,0) + (0,0,x^3) = x^1(1,0,0) + x^2(0,1,0) + x^3(0,0,1)$.
$\vec e_1 := (1,0,0), \vec e_2 := (0,1,0), \vec e_3 := (0,0,1)$ are unit vectors.
$x^1, x^2, x^3$ give the amount of the vector along their respective unit vector and are called the components.
The magnitude of the $x$ vector is found with the Pythagorean theorem where every component of the vector is a leg of a tetrahedron.
The magnitude is written out as $|\vec x| = \sqrt{\sum_{i=1}^3(x^i)^2}$.

A classic example of a vector is the displacement vector $\Delta \vec x = (\Delta x^1,\Delta x^2,\Delta x^3)$, representing a displacment in 3D space.
The distance displaced is given by the magnitude of the displacement vector, $|\Delta \vec x| = \sqrt{(\Delta x^i)^2 + (\Delta x^2)^2 + (\Delta x^3)^2}$.

## Scaling vectors

Let's take a more concrete example of the displacement vector where $\Delta \vec x = (1m, 2m, 3m)$ where $m$ is a meter.
We can can decompose our displacement vector, $\Delta \vec x = (m, 0, 0) + 2(0, m, 0) + 3(0, 0, m)$.
One may be temmpted to say we have a vector like $(1,2,3)m$.
But, this array of numbers has no meaning because it's depedent on the particular Cartesian coordinate system we choose.

Let's take use another unit like $cm$.
We can write our vector as $\Delta \vec x = (100cm, 200cm, 300cm)$.
Decomposing again we can write the vector as $\Delta \vec x = 100 (cm, 0, 0) + 200(0, cm, 0) + 300(0, 0, cm)$.
So we can see that there is a 100 fold increase in our vector components.
Of course, this is just a change of units but in terms of coordinates systems we essentially changed the spacing of our Cartesian grid.

## Rotating Vectors

Let's say take the same vector again $\Delta \vec x = (m, 0, 0) + 2(0, m, 0) + 3(0, 0, m)$.
This time we choose a new grid that is rotated 90 degrees counter Clockwise in the x-y plane.
Equivalently, we could of also just rotated the vector 90 clockwise.
Our displacement vector is $\Delta \vec x = 2(m, 0, 0) - (0, m, 0) + 3(0, 0, m)$.
The "$(.,.,.)$" here means something different from before.
For example "$(m, 0, 0)$" points one meter "east" from before the transformation.
"$(m, 0, 0)$" points one meter "north".
We can see this since we can see that the transformation takes $2(0, m, 0)\rightarrow 2(m, 0, 0)$.
Both expressions mean "points northwards".

## A Change of Notation

Having $(m, 0, 0)$ possibly mean "points northwards" and "points eastwards" can be confusing.
For the rest of this article I would like to change to a different notation.
Instead, let's just use letters with hats.
For example, $\widehat{n}$ means "one meter north", $\widehat{e}$ means "one meter east", and  $\widehat{u}$ means "one meter up".
In this notation, no matter the coordinates used, the direction is still the same.
It's like no matter how a city grids up, the direction of north is still the same.
We can choose to align our grid with these direction like one meter along the y axis is one meter north.
So, connecting with the previous notation we have $\widehat{n} \equiv (m,0,0)$.
Furthermore, we can interpret $(m,0,0)$ as meaning "points one meter (one unit) along the x component of a grid", giving it a new name $\hat e_x \equiv (m,0,0)$.
The nice feature about such notation is that it's depedence of coordinates is clear.
If we had a different x coordinate called $x'$, we could associate it's vector with $\hat e_{ x' }$.[^1]

[^1]: Another notation for vectors is $e_x \equiv \frac{ \partial }{ \partial x}$, where vectors in the second notation have the meaning derivatives. But for our case we will stick to $e_x$.

It is this link between coordiantes and direction that gives rise depednence on coordinates.
Nevertheless, the world does not care about how humans grid up the world.
Humans themselves all have their own way to grid up the world.
If we don't all agree on coordinates, our physical theories can give apparently contradictory results.
This ambiguity of coordinates is not good for physics which aims to describe the one reality is posits to exist.
Mathematically, we can partially fix problem with covectors.

# Covectors

Covectors are simply *linear* functions that convert vectors to numbers that do not depend on the grid (coordinates).
Let's make a covector, $W$.
Let's assume for our 3D grid of one meter spacing we have the *basis* vectors $\hat e_x$, $\hat e_y$, and $\hat e_z$.
We define $W$ by defining what it does to each of these vectors.

$$
W(\hat e_x) := 1m
$$
$$
W(\hat e_y) := 2m
$$
$$
W(\hat e_z) := 3m
$$

So for example we have a vector $V = 4 \hat e_x + 5 \hat e_y + 6 \hat e_z$.
Acting on $V$ with $W$ we get.

$$
W(V) = W(4 \hat e_x + 5 \hat e_y + 6 \hat e_z)
$$
$$
W(V) = W(4 \hat e_x) + W( 5 \hat e_y ) + W( 6 \hat e_z )
$$
$$
W(V) = 4 W(\hat e_x) + 5 W( \hat e_y ) + 6 W( \hat e_z )
$$
$$
W(V) = 4 (1m) + 5 (2m) + 6 (3m)
$$
$$
W(V) = 32m
$$

We used linearity to distribute and factor through $W$ to get the second and third equalities.
Because of linearity, we can decompose $W = m\hat e^x + 2m\hat e^y + 3m\hat e^z$ into unit covectors, $\hat e^i$.
Application of $W(V)$ can be written as $W(V) = \hat e^x(V) + 2\hat e^y(V) + 3\hat e^z(V)$.
$\hat e^i$ are defined by $\hat e^i(\hat e_j) = \delta_j^i$ where $\delta_j^i = 1\text{ if }j = i\text{ else }0$.[^2]

[^2]: There is also another notation for covectors where $e^x = dx$.

In this I can give my interpretation of a covector. 
A covector are mathematical rulers.
They give coordinate independent results from vectors.
This coordinate independence is guaranteed because $W$ must transform such that it is[^3].

[^3]: I did not mention this in the **informal** definition so sue me.

## What about Length

On might recall that for the displacement vector we can calculate the length by summing the square of the components (the Pythagorean theorem).
Surely the length of an object or a distance measurement does not depend of coordinates?
This length calculation seemingly does not use covectors.
In fact, this length calculation does.
This involves a new concept of geometry called a [ *metric tensor* ](https://en.wikipedia.org/wiki/Metric_tensor), but I think this article as gone on long enough.
