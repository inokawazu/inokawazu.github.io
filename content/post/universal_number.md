+++
title = 'Universal Number'
date = 2023-11-14T08:30:48+09:00
tags = ["physics", "computing"]
slug = "universal-number"
math = true
+++

The Universal Number
: (As of current knowledge) every possibly measurable quantity can be represented with $10^{134}$ bytes (or bits).

------------------------------------

**Why?**

<!-- If ever word in a computer used 256 bytes, that would be enough precision to represent every number in the universe with any known measurement device. -->

<!-- Let's say the smallest quantity is limited by planck -->

First, I would like to make some assumptions!
Let's same you make a measurement to distinguish the physical states of the world.

For example, a potato could of many lengths!
We use rulers to distinguish *which universe*[^multiverse] we are in such that the potato is so long.
Effectively, the smallest length increment is the [Planck length](https://en.wikipedia.org/wiki/Planck_units#Planck_length).
This is about $1.6\times10^{-35}\mathrm{m}$
The [ diameter of the observable universe ](https://en.wikipedia.org/wiki/Observable_universe)[^currentdia] is  $8.8\times10^{26}\mathrm m$.
If we made a ruler this long which every decrement link one Planck length apart, the number of possible potato lengths is $8.8\times10^{26}\mathrm m/ (1.6\times10^{-35}\mathrm{m}) \approx 14\times 10^{61}$
Big number but some we can handle 😉.
The number of bytes to represent such number of states is $n$ such that $\left(2^8\right)^n = 10^{ 63 }$. [^rounding]
This is because a byte is $8$ bits so $2^8$ is the number of states one byte could represent.
So $n = \log_{2^8}\left(10^63\right) = 63\log_{256}(10) \approx 25.99 \approx 26$
So, $26$ bytes for all possible potatoes.

In order to find the number of possible measurable quantitites, the idea is to find the number of states possible and then take the $\log_{256}$ of it.

Let's say the maximum number if states you can contain in a given surface area is [ bounded by the entropy of a black hole ](/content/post/black-hole-entropy-bound).
[ That is ](https://en.wikipedia.org/wiki/Black_hole_thermodynamics#Overview) 
$S_{BH}/A = k_B/(4\ell^2_P)$
The number of microstates (which is the number of possible states) is given by 
$\Omega = \exp(S_{BH}/k_{B}) = \exp( {1.253×10^{ 80 }/\mathrm m^2 \times A} )$.
Given that the observable universe has a surface area of $2.43\times54\mathrm m^2$.
So $\ln \Omega \approx 3.04e134$. $\Omega$ is big number. 
$\ln \Omega$ can be seen as the number of *natural bits*, but we want in terms of bytes.
So, we just need to change bases to find $\log_{256} \Omega$.
This is just $\log_{256} \Omega = \ln\Omega/\ln 256 \approx 10^{134}$.
This number is so big because it's the number of every possible* measurement.

[^multiverse]: Hypothetical
[^currentdia]: Current diameter of the observable universe.
[^rounding]: Rounding up to $10^62$ to play in safe.
