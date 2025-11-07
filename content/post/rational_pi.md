+++
title = 'Rational π'
date = 2025-11-07T21:34:56+09:00
math = true
tags = [ "programming", "math" ]
+++

# Going around the circle n times

So I was thinking about going around the circle some integer number of times [^asyou] or by some rational fraction of the circle.
If you go around the circle $n$ times, where $n$ is an integer, you end up where you started [^trivial].
If you go a rational fraction of the circle, you do not end up back at the start after one move.
To keep the math straightforward, let's say we move by a rational number, $\rho \equiv a/b \in \mathbb{Q}$, where $a, b \in \mathbb{Z}$, and we move around the circle $\rho\pi$ radians.
Let's also assume $a/b$ is the fraction in reduced form.
If we move this amount $n$ times, we would move $n\rho\pi$ radians.
We would come back to the start if we ended up moving some multiple of $2\pi$ radians.
In other words, $2\pi m$ radians for some integer $m$.
We can see that if we move $b$ times, we would have traveled $a\pi$.
If $a$ is even, it would be some $2m\pi$ for some number $m$, but that's the condition that we move some multiple of $2\pi$ radians.
If $a$ is odd, we actually have to move $2b$ times.
In short, we have to move $2b / \mathrm{gcd}(2, a)$ times, where $\mathrm{gcd}$ is the greatest common divisor, to come back to the start.

[^asyou]: As you do...
[^trivial]: [The trivial case, Watson](https://www.youtube.com/watch?v=echK0RhFKcQ)

# Going around the circle by π

What if instead we moved $2/\pi$ multiples of $\pi$ radians, i.e., $2$ radians?
So, moving $n \in \mathbb{Z}$ times, we would have moved $2n$ radians.
To come back to where we started, we would have had to move $n$ times such that $2n = 2m\pi \Leftrightarrow n = m\pi$, where $m \in \mathbb{Z}$.
This would be true if there were two integers where $\pi = n/m$.
This would mean that $\pi$ is a rational number, but we know that it is not, so $\pi = n/m$ cannot be satisfied.
So, if you move $2/\pi$ at a time, you would never come back to the start.
But you can come close.

## Programming: Coming Close to the Start

Using Julia, we can scan through integers such that $|\mathrm{round}(m\pi) - m\pi|$ is small for some integer $m$.
We can then define $n := \mathrm{round}(m\pi)$.
Then we can take $m/n$ as an approximation of $\pi$.
We can define the `findpiapprox` function to search up to `maxm`.

```julia
findpiapprox(maxm) = let minpi = 1
   finderr(n) = abs(round(n*pi) - n*pi)
   besterr = finderr(minpi)
   for m in minpi:maxm
       nexterr = finderr(m)
       if nexterr < besterr
           besterr = nexterr
           minpi = m
           n = round(Int, pi*m)
           println("m=$m and n=$n where $n/$m = $(n/m)")
       end
   end
end
```

For `maxm = big(1_000_000)`, we have:

```
m=7 and n=22 where 22/7 = 3.142857142857
m=106 and n=333 where 333/106 = 3.141509433962
m=113 and n=355 where 355/113 = 3.141592920353
m=33102 and n=103993 where 103993/33102 = 3.141592653011
m=33215 and n=104348 where 104348/33215 = 3.141592653921
m=66317 and n=208341 where 208341/66317 = 3.141592653467
m=99532 and n=312689 where 312689/99532 = 3.141592653618
m=265381 and n=833719 where 833719/265381 = 3.141592653581
m=364913 and n=1146408 where 1146408/364913 = 3.141592653591
```

There's the famous approximation of $\pi$, $22/7$.
If you're not too picky, you can use $355/113$, which gets you 6 digits of $\pi$ correctly.
Our best approximation, $1146408/364913$, gets 11 digits.
If we don't mind being mathematically imprecise, then moving $2/\pi$ would require you to move $22$ times to get close to the start.

# Further Reading

- [ The Indirect Inspiration ]( https://www.youtube.com/watch?v=GOcM9gDwQYY )
