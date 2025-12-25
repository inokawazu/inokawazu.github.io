+++
title = 'Hello Brachistochrone'
date = 2025-12-22T20:56:27+09:00
math = true
draft = true
+++

# Hello Brachistochrone

The brachistochrone is the curve that minimizes the time it takes for a frictionless object to slide along to reach from the top to the bottom across some horizontal span where the object starts at rest.
For this article I want to introduce the brachistochrone[^1] from the aforementioned definition.
The solution brachistochrone problem has been well covered and then some, so for the curious I have included [articles](#more-reading) for one to learn more!

[^1]: see title

# Describing up the Problem

To start, let's start with the simple and original version of the Brachistochrone.
We have an object with mass $m$ that slides frictionlessly along a *smooth* path of our choosing.
The path must start from an elevated point and must end somewhere horizontally $L$ away and $h$ below.
Furthermore, there is a downwards gravitation force that acts on our object with a magnitude of $mg$.
We can situate the beginning at the origin where the downwards direction is in the positive $y$ direction and moving horizontally (towards the goals) is the positive $x$ direction.
So in our $x$-$y$ coordinates the end is at $(L, h)$.
Note: that aslong as our path is only in our $x$-$y$, we do not have to worry about the third "$z$" direction.
Our force can be written as $\vec F_g = mg\hat y$.

There is a nice way to solve this via [energy conservation](https://en.wikipedia.org/wiki/Energy_conservation) and [calculus of variations](https://en.wikipedia.org/wiki/Calculus_of_variations).
First, let's start with Newton's Second Law for our object.

\begin{equation}
    m \frac{d^2\vec r}{{dt}^2} = \vec F_\mathrm{net} = \vec F_g
\end{equation}

This gives two differential equations of motion.

\begin{equation}
    \begin{aligned}
        m \frac{d^2 x}{{dt}^2} &= 0\\\\
        m \frac{d^2 y}{{dt}^2} &= mg\\\\
    \end{aligned}
\end{equation}

Multiplying the top and bottom by $\frac{dx}{dt}$ and $\frac{dy}{dt}$ respectively, we find we can rewrite the equations as total derivatives of time!

\begin{equation}
    \begin{aligned}
        m \frac{d^2 x}{{dt}^2}\frac{dx}{dt} &= 0\\\\
        \\left(m \frac{d^2 y}{{dt}^2}\frac{dy}{dt} - mg \frac{dy}{dt}\\right) &= 0\\\\
    \end{aligned}
\end{equation}

and then

\begin{equation}
    \begin{aligned}
        \frac m2 \frac{d}{dt}\left(\left( \frac{dx}{dt} \right)^2\right) &= 0\\\\
        \frac{d}{dt}\left(\frac m2 \left( \frac{dy}{dt} \right)^2 - mgy\right) &= 0\\\\
    \end{aligned}
\end{equation}

These equations are nice, the conservations of energy and momentum, but these equations described *unconstrained* motion.
Also, worse yet, if we just used these to look at the motion of the object, it would just drop unable to move horizontally reaching the goal.
We need to constrain the motion of our body.
In practice, this can be implemented by setting $y$ to be a function of $x$.
So we write $y$ as $y = f(x)$ for some smooth function of $f$.
So our object must travel along a long traces out a curve by (x, f(x)).
To enforce this condition, we can introduce constraint forces.
Let's look at the second equation of motion with unkown constraint force $\vec K$.
To make progress, let's write our constraint as a equation that must be satisfied, $y - f(x) = 0$.
Notice that $y - f(x) = 0$ is one of many curves of a whole family of curves $y - f(x) = w$.
These curves are parameterized by $w$, which can be taken as a new coordinate.
$y = w + f(x)$ where $w = 0$ is but just one special case.
The role of the constraint force is to disallow motion in the $w$ direction, similar to the normal force on an incline plane.

\begin{equation}
    dy - f' dx = dw
\end{equation}

\begin{equation}
    (a\partial_y + b\partial_x) w = a - b f' = 0 \implies  b = a/f'
\end{equation}

\begin{equation}
    \hat u = \frac {f'}{\sqrt{1 + f'^2}} (\hat y + \frac{1}{f'}\hat x)
\end{equation}

\begin{equation}
    \hat w = \frac 1{\sqrt{1 + f'^2}}(\hat y - f'\hat x)
\end{equation}

Our contraints enforces no motion in the perpedicular direction, $w$, so $\dot w = 0$.
This is equivalent to $\dot y - f'\dot x = 0 \implies \dot y = f'\dot x$ linking $x$'s motion to $y$'s motion.
So now there is only motion in the $u$ direction.
Recall that the power a force provides is given by $P = \int v\dot F$.
Since $\dot w = 0$, there is not power (change energy) from our constraint force.
This allows use to just consider all the other forces which are conservative.
So we now consider the unchanging total energy, E.

\begin{equation}
    \begin{aligned}
        E &= \frac m2 v \cdot v - mgy\\\\
        E &= \frac m2 v^2 - mgy\\\\
        2mE + 2gy &= v^2\\\\
        |v| &= 2mE + 2gy\\\\
    \end{aligned}
\end{equation}

So we have a explicit expression for the speed $|v|$.
Calculating the time total time we use the integral of the time differentials of the object's journey, $T = \int dt$.
$dt$ can related to dispacement by $\vec v dt = d\vec r$.
Taking the magnitude and solving for $dt$, we have $dt = \frac{dr}{|v|}$.
Explicitly, the differential dispacement magnitude is $dr = \sqrt{dx^2 + dy^2}$.
With the constraint, this is can be simplifyed to only depend on $dx$ where 

\begin{equation}
    \begin{aligned}
        dr &= \sqrt{1 + \left( \frac {dy}{dx} \right)^2} dx \\\\
        dr &= \sqrt{1 + f'^2} dx \\\\
    \end{aligned}
\end{equation}

So our time integral becomes

\begin{equation}
    \begin{aligned}
        T &= \int \frac{\sqrt{1 + f'^2}}{|v|} dx \\\\
        T &= \int \frac{\sqrt{1 + f'^2}}{2mE + 2gf} dx \\\\
    \end{aligned}
\end{equation}

Since we are starting at the orgin at rest our energy vanishes, $E = 0$.

\begin{equation}
    T = \int \frac{\sqrt{1 + f'^2}}{2gf} dx
\end{equation}

So now our problem reduces to finding the constraint function $f$ such that $T$ is minimal.
From calculus of variations we can use the [Beltrami Identity](https://en.wikipedia.org/wiki/Beltrami_identity).
This reduces our integral problem to a first order boundary value problem for $f$.

\begin{equation}
    \frac{1}{2g}\frac{1}{f\sqrt{1+f'^2}} = C
\end{equation}

where $C$ is some constant.

We can rewrite the equation

\begin{equation}
    \begin{aligned}
        \frac{1}{f^2} &= C^2(1+f'^2) \\\\
        \frac{1}{C^2 f^2} - 1 &= f'^2 \\\\
        f' &= \sqrt{ \frac{1}{C^2 f^2} - 1 } \\\\
        \frac{f'}{\sqrt{ \frac{1}{C^2 f^2} - 1}} &= 1 \\\\
    \end{aligned}
\end{equation}

Using seperation of variables we can solve for $f$

\begin{equation}
    \begin{aligned}
        \int \frac{df}{\sqrt{ \frac{1}{C^2 f^2} - 1}} &= \int_0^x dx \\\\
        \int \frac{C f df}{\sqrt{ 1 - C^2 f^2}}  &= \int_0^x dx \\\\
        \int\frac{\frac C2 d(f^2)}{\sqrt{ 1 - C^2 f^2}}  &= x - K \\\\
        \frac C2 \frac{2}{-C^2}\sqrt{ 1 - C^2 f^2} &= x - K \\\\
        \sqrt{ 1 - C^2 f^2} &= -C(x - K) \\\\
        f &= \sqrt{ 1 - C^2 (x - K)^2 }/C \\\\
    \end{aligned}
\end{equation}

Note the boundary conditions where the object must end at $(L, h)$ and start at the origin.
We can set $C$ and $K$ to satisfy these conditions.
These conditions imply

\begin{equation}
    \begin{aligned}
        C &= \frac {2L}{h^2 + L^2} \\\\
        K &= \frac {h^2 + L^2}{2 L} \\\\
    \end{aligned}
\end{equation}

We must take the positive solution for $f$ to remain positive (ie to avoid imaginary energies)
so
%
\begin{equation}
    f = \frac{\sqrt{L (h^2 + L (L-x)) x}}{L}
\end{equation}

Replacing $f$ with $y$ we and squaring we find the following

\begin{equation}
    y^{2}L^{2}=L(h^{2}+L(L-x))x
\end{equation}

Completing the square we find

\begin{equation}
    y^{2} + \left( x - \frac{h^{2} + L^{2}}{2L} \right)^{2} = \frac{(h^{2} + L^{2})^{2}}{4L^{2}}
\end{equation}

This is an equation for a circule with radius $R = \frac{\sqrt{(h^{2} + L^{2})^{2}}}{2L}$.

# More Reading

- [The Wikipedia page for the brachistochrone](https://en.wikipedia.org/wiki/Brachistochrone)
- [Brachistochrone inside the Earth: The Gravity Train]( https://www.physics.unlv.edu/~maxham/gravitytrain.pdf )
- [Some Generalisations of Brachistochrone Problem]( https://www.researchgate.net/publication/298004003_Some_generalisations_of_brachistochrone_problem )
- [What is the definition of a Brachistochrone curve in a non-Euclidean space?](https://physics.stackexchange.com/questions/763541/what-is-the-definition-of-a-brachistochrone-curve-in-a-non-euclidean-space)
- [The Brachistochrone Problem With Frictional Forces](https://www.esaim-cocv.org/articles/cocv/pdf/2000/01/cocvVol5-8.pdf)
- [Brachistochrone-ruled timelike surfaces in Newtonian and relativistic spacetimes](https://arxiv.org/abs/2512.08776v2)
- [Curvature and mechanics](https://www.sciencedirect.com/science/article/pii/0001870875901395?ref=pdf_download&fr=RR-2&rr=99c211bbdfa90644)
- [The Brachistochrone Problem in a Stationary Space‐time](http://dx.doi.org/10.1063/1.529472)
- [The Arrival Time Brachistochrones in General Relativity](https://link.springer.com/article/10.1007/BF02922047)
