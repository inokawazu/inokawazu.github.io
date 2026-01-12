+++
title = 'Hello Brachistochrone'
date = 2025-12-22T20:56:27+09:00
math = true
draft = true
+++

# Hello Brachistochrone

The brachistochrone is the curve that minimizes the time it takes for a frictionless object to slide along to reach from the top to the bottom across some horizontal span, where the object starts at rest.
For this article, I want to introduce the brachistochrone[^1] from the aforementioned definition.
The solution to the brachistochrone problem has been well covered and then some, so for the curious I have included [articles](#more-reading) for one to learn more!

[^1]: see title

# Describing the Problem

To start, let's begin with the simple and original version of the brachistochrone.
We have an object with mass $m$ that slides frictionlessly along a *smooth* path of our choosing.
The path must start from an elevated point and must end somewhere horizontally $L$ away and $h$ below.
Furthermore, there is a downward gravitational force that acts on our object with a magnitude of $mg$.
We can situate the beginning at the origin, where the downward direction is in the positive $y$ direction and moving horizontally (towards the goal) is the positive $x$ direction.
So in our $x$-$y$ coordinates, the end is at $(L, h)$.
Note that as long as our path is only in our $x$-$y$ plane, we do not have to worry about the third "$z$" direction.
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

Multiplying the top and bottom equations by $\frac{dx}{dt}$ and $\frac{dy}{dt}$ respectively, we find we can rewrite the equations as total derivatives with respect to time.

\begin{equation}
    \begin{aligned}
        m \frac{d^2 x}{{dt}^2}\frac{dx}{dt} &= 0\\\\
        \left(m \frac{d^2 y}{{dt}^2}\frac{dy}{dt} - mg \frac{dy}{dt}\right) &= 0\\\\
    \end{aligned}
\end{equation}

and then

\begin{equation}
    \begin{aligned}
        \frac m2 \frac{d}{dt}\left(\left( \frac{dx}{dt} \right)^2\right) &= 0\\\\
        \frac{d}{dt}\left(\frac m2 \left( \frac{dy}{dt} \right)^2 - mgy\right) &= 0\\\\
    \end{aligned}
\end{equation}

These equations are nice—the conservation of energy and momentum—but they describe *unconstrained* motion.
Also, worse yet, if we just used these to look at the motion of the object, it would simply drop, unable to move horizontally to reach the goal.
We need to constrain the motion of our body.
In practice, this can be implemented by setting $y$ to be a function of $x$.
So we write $y$ as $y = f(x)$ for some smooth function $f$.
Thus, our object must travel along a path that traces out a curve given by $(x, f(x))$.
To enforce this condition, we can introduce constraint forces.
Let's look at the second equation of motion with an unknown constraint force $\vec K$.
To make progress, let's write our constraint as an equation that must be satisfied: $y - f(x) = 0$.
Notice that $y - f(x) = 0$ is one of many curves in a whole family of curves $y - f(x) = w$.
These curves are parameterized by $w$, which can be taken as a new coordinate.
We have $y = w + f(x)$, where $w = 0$ is just one special case.
The role of the constraint force is to disallow motion in the $w$ direction, similar to the normal force on an inclined plane.

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

Our constraint enforces no motion in the perpendicular direction, $w$, so $\dot w = 0$.
This is equivalent to $\dot y - f'\dot x = 0 \implies \dot y = f'\dot x$, linking $x$'s motion to $y$'s motion.
So now there is only motion in the $u$ direction.
Recall that the power a force provides is given by $P = \int v\dot F$.
Since $\dot w = 0$, there is no power (change in energy) from our constraint force.
This allows us to just consider all the other forces, which are conservative.
So we now consider the unchanging total energy, $E$.

\begin{equation}
    \begin{aligned}
        E &= \frac m2 v \cdot v - mgy\\\\
        E &= \frac m2 v^2 - mgy\\\\
        2mE + 2gy &= v^2\\\\
        |v| &= \sqrt{2E/m + 2gy}\\\\
    \end{aligned}
\end{equation}

So we have an explicit expression for the speed $|v|$.
To calculate the total time, we use the integral of the time differentials of the object's journey, $T = \int dt$.
The differential $dt$ can be related to displacement by $\vec v\, dt = d\vec r$.
Taking the magnitude and solving for $dt$, we have $dt = \frac{dr}{|v|}$.
Explicitly, the differential displacement magnitude is $dr = \sqrt{dx^2 + dy^2}$.
With the constraint, this can be simplified to only depend on $dx$, where

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
        T &= \int \frac{\sqrt{1 + f'^2}}{\sqrt{2E/m + 2gf}} dx \\\\
    \end{aligned}
\end{equation}

Since we are starting at the origin at rest, our energy vanishes: $E = 0$.

\begin{equation}
    T = \int \frac{\sqrt{1 + f'^2}}{\sqrt{2 g f}} dx
\end{equation}

<!-- 

$Assumptions = f[x] > 0 && g > 0

lag = Sqrt[(1 + f'[x]^2)/(2g f[x])]//FullSimplify

eom = lag - f'[x] D[lag, f'[x]] == C//FullSimplify
eom//TeXForm

f'[x]/.Last@Solve[eom, f'[x]]//FullSimplify
finte = 1/%//TeXForm

Integrate[finte/.{f[x] -> f}, f]

-->

So now our problem reduces to finding the constraint function $f$ such that $T$ is minimized.
From calculus of variations, we can use the [Beltrami Identity](https://en.wikipedia.org/wiki/Beltrami_identity).
This reduces our integral problem to a first-order boundary value problem for $f$.

\begin{equation}
    \frac{1}{\sqrt{2} \sqrt{g f(x) \left(f'(x)^2+1\right)}}=C
\end{equation}

where $C$ is some constant.

We can rewrite the equation

\begin{equation}
    f'\frac{C}{\sqrt{\frac{1}{2 g f(x)}-C^2}} = 1
\end{equation}

<!-- \begin{equation} -->
<!-- \begin{aligned} -->
<!--         \frac{1}{f^2} &= C^2(1+f'^2) \\\\ -->
<!--         \frac{1}{C^2 f^2} - 1 &= f'^2 \\\\ -->
<!--         f' &= \sqrt{ \frac{1}{C^2 f^2} - 1 } \\\\ -->
<!--         \frac{f'}{\sqrt{ \frac{1}{C^2 f^2} - 1}} &= 1 \\\\ -->
<!--     \end{aligned} -->
<!-- \end{equation} -->

Using separation of variables, we can solve for $f$.

\begin{equation}
    \begin{aligned}
        \int df\frac{C}{\sqrt{\frac{1}{f}-C^2}} &= \int dx \\\\
        \int df\frac{C}{\sqrt{\frac{1}{f}-C^2}} &= x + K \\\\
        \int df C \sqrt{\frac{f}{1-fC^2}} &= x + K \\\\
        &\text{set $f = (a u - b)/C^2$}\\\\
        \int a du/C^2 C \sqrt{\frac{(a u - b)/C^2}{1-(a u - b)}} &= x + K \\\\
        \int a du/C^2 \sqrt{\frac{a u - b}{1-a u + b}} &= x + K \\\\
        &\text{set $b = -1/2$ and $a = 1/2$}\\\\
        \int \frac{ du }{2C^2} \sqrt{\frac{1+u}{1-u}} &= x + K \\\\
        \int \frac{ du }{2C^2} \sqrt{\frac{1+u}{1-u}} &= x + K \\\\
        &\text{set $u = \cos \theta$}\\\\
        \int \frac{ d\theta }{2C^2} (-\sin(\theta)\cot(\theta/2)) &= x + K \\\\
        \int \frac{ d\theta }{2C^2} (-2\sin(\theta/2)\cos(\theta/2)\cot(\theta/2)) &= x + K \\\\
        -\frac 1{C^2}\int  d\theta \sin^2(\theta/2) &= x + K \\\\
        \frac 1{2C^2}( \sin(\theta) - \theta) &= x + K \\\\
    \end{aligned}
\end{equation}

<!-- 

Integrate[Sqrt[( 1+u )/(1-u)], u]//FullSimplify
FullSimplify[%/.{u -> Cos[theta]}, Element[theta, Reals]]

Integrate[-Sin[theta/2]^2, theta]

-->

Here we have $x$ parameterized by $\theta$.
Taking the start to be at $\theta = 0$, we see that $K=0$ and 
Also we can negate $\theta \rightarrow - \theta$ such that $x$ is increasing with $\theta$.

\begin{equation}
    \begin{aligned}
        x &= \tilde C (\theta - \sin(\theta))\\\\
        y &= \tilde C (1- \cos(\theta))\\\\
    \end{aligned}
\end{equation}

The end theta and $\tilde C$ can be choosen such that the curve intersects point $(L, h)$.

<!-- 

Solve[{L == C (Sin[theta] - theta), h == C (Cos[theta] - 1)}, {C, theta}]

-->

# A Light Generalization

We can imagine exerting our object under another force.
Others have done this generalization to introduce frictional forces and one over r squared forces (cf [ more reading ](#more-reading)).
For a first foray let's take our gravitational force to be a general conservative force with a potential, $U(\vec r)$.

\begin{equation}
    |v| = \sqrt{\frac{2E-2U}{m}}
\end{equation}

The total time can now be calculated as

\begin{equation}
    T = \int dr \sqrt{\frac{m}{2E-2U}}
\end{equation}

## The Simple Harmonic Taco Bowl

Let's say that you have a taco-shaped parabolic bowl[^bowl] where you let it go from up along the bowl to roll back down and up some other point.
So horizontally we start the ball at $(x_i, y_0)$ and end it at $(x_i, y_0)$.
The profile of the bowl can be modeled with this height function $z = \frac k 2 y^2$ where we have situated the y-axis to be aligned with the lower ridge of the bowl and the $z$ direction to point upwards.
Implicitly our object now is constrained to the surface, so choosing its motion along the x-y plane suffices to know its vertical location.
Like before, we can constrain $y$ with respect to $x$ as $y(x)$ as [abuse of notation](https://www.reddit.com/r/mathmemes/comments/13yjppt/abuse_of_notation/).

These two constraints allow us to write the magnitude of the displacement as 

\begin{equation}
    dr = \sqrt{1 + \frac{dz}{dx} + \frac{dy}{dx}} dx
\end{equation}

It looks like $\frac{dz}{dx} = 0$ but recall that $y$ also depends on $x$ so we have to use the chain rule here.

\begin{equation}
    \begin{aligned}
        dr &= \sqrt{1 + \frac{dz}{dy}\frac{dy}{dx} + \frac{dy}{dx}} dx \\\\
        dr &= \sqrt{1 + k y \frac{dy}{dx} + \frac{dy}{dx}} dx \\\\
        dr &= \sqrt{1 +  (k y + 1)y'} dx \\\\
    \end{aligned}
\end{equation}

The gravitational potential then is $U = mgz = \frac{mgk}{2} y^2$
Note that the sign of the potential is now different since $z$ is pointing downwards.
So we can write the total time functional as

\begin{equation}
    T = \sqrt{m} \int \sqrt{\frac{1 +  (k y + 1)y'}{2E - mgk y^2}} dx
\end{equation}

Since we are dropping from rest, the energy must be set to $E = \frac{mgk}{2} y_0^2$ so we can write the final expression for $T$ as

\begin{equation}
    T = \frac{1}{\sqrt{gk}} \int \sqrt{\frac{1 +  (k y + 1)y'}{y_0^2 - y^2}} dx
\end{equation}

Using the Beltrami identity we can again derive the differential equation for $y(x)$.

\begin{equation}
    \frac{(k y+1) y'+2}{2 \sqrt{\left(y_0^2-y^2\right) \left((k y+1) y'+1\right)}}=C
\end{equation}

Note that since there is corresponding movement in the $z$ direction, this forces additional terms in our ODE.
i.e. fast movement along $y$ accompanies rapid changes in height.
Solving for $y'$ we can then use separation of variables to integrate for $y$.

$$
    \int \frac{1}{2} \left(\frac{\sqrt{\left(y^2-y_0^2\right) (C k y+C)^2 \left(C^2 y^2-C^2 y_0^2+1\right)}}{-C^2 y^2+C^2 y_0^2-1}-k y-1\right) dy = x + K
$$

This integral is obviously non-trivial. 
To make any headway, let's look at a special case where $C = 0$.
Our integral equation then becomes

\begin{equation}
    \begin{aligned}
        \int \frac{-k y - 1}{2} dy &= x + K\\\\
        \frac 12 \left(-k \frac 12 y^2 - y \right) &= x + K\\\\
    \end{aligned}
\end{equation}

[wlog](https://en.wikipedia.org/wiki/Without_loss_of_generality) we can set $x_0 = 0$ so


\begin{equation}
    K = \left(-\frac k4 y_0^2 - \frac 12 y_0 \right)
\end{equation}

We could solve for $y$ here but instead, we can just switch our path's parameter to be $y$ instead.
So we have

\begin{equation}
    \begin{aligned}
        x &= \frac k4 (y_0^2 - y^2) + \frac 12 (y_0-y)\\\\
        z &= \frac k2 y^2\\\\
    \end{aligned}
\end{equation}

So an optimal path is parabolic.
There is a maximum $x$ at

\begin{equation}
    x = \frac{(y_0 k+1)^2}{4 k}
\end{equation}

which is not at the bottom of the taco bowl surprisingly.
However, since we set $C=0$, we actually cannot solve the problem to set the final $x$ or $y$.
Though, we can be confident that $|y|\leq |y_0|$ since energy there vanishes.
If we were to solve this problem numerically, this could help us bound the problem to find $C$ such that our path ends at a certain point.

<!-- 

$Assumptions = y[x]^2 < a^2 && k> 0

lag = Sqrt[( 1 + (k y[x] + 1) y'[x])/(a^2 - y[x]^2)]

eom = lag - y'[x] D[lag, y'[x]] == C//FullSimplify
%//TeXForm

y'[x] /. ypRule//FullSimplify
1/%[[1]]//FullSimplify//ReplaceAll[y[x] -> t]//TeXForm
1/%%[[2]]//FullSimplify//ReplaceAll[y[x] -> t]//TeXForm

ypRule = Solve[eom, y'[x]]//FullSimplify
y'[x]/.%
1/%//FullSimplify//TeXForm
1/%%/.{y[x]->t}//FullSimplify
TeXForm[%[[1]]]
TeXForm[%%[[2]]]

eom/.{C->0}
1/y'[x]/.First@Solve[%, y'[x]]
yc0sol = Integrate[%,{y[x], a, y}]//FullSimplify
First@Solve[% == x, y, Assumptions -> True]
y/.%//TeXForm

a^2 k^2+2 a k-4 k x+1 == 0
x/.First@Solve[%, x, Assumptions -> True]//FullSimplify//TeXForm

-->

[^bowl]: For some reason... But in all seriousness, it's just a half pipe!

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
