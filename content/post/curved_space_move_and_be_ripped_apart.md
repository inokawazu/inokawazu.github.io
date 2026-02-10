+++
title = 'Curved Space: Move and be Ripped Apart'
date = 2026-02-10 21:14:52+09:00
math = true
draft = true
tags = ["math", "physics"]
+++

# Absolute Velocity[^cinema]

[^cinema]: Cinema

Knowing one's speed is important in daily life.
A 60 km/hr car is much more dangerous than a stationary one.
However, the physically important source of danger here is the *difference* in speed.
A 60 km/hr car is 60 km/hr faster than you, so any collision (resulting in a large and dangerous acceleration) would feel *not so* great.
If we moved parallel to the car at the same speed, we would find that we could treat it just as a stationary car.
Simply put, absolute speed (*movement*) is undetectable, but relative speed is.

This particular fact was first observed by [Galileo Galilei](https://en.wikipedia.org/wiki/Galileo_Galilei).
[Inside a ship, moving across calm water,](https://en.wikipedia.org/wiki/Galileo%27s_ship) if there were no windows, one could not know the ship was moving.
Therefore, there is no *local* experiment that could detect this motion.
So, this is why the principle of absolute speed's undetectability is called [Galilean Relativity](https://en.wikipedia.org/wiki/Galilean_invariance)[^galilean].
Later on, Einstein realized that in nature, not only is absolute speed undetectable, but for all non-accelerating observers the speed of light is a constant $c = 299,792,458$ m/s.

[^galilean]: Galilean relativity (and later the principle of relativity) implies the conservation of momentum because it's fundamentally a symmetry of nature.

# Curved Space

In 1915, Einstein presented [his theory of relativity](https://en.wikipedia.org/wiki/Theory_of_relativity).
According to his theory, gravity is not due to an invisible "force field," but due to the shape of space and time itself; space can bend in space-like directions or in the time-like direction.
In fact, the apparent gravitational force we experience every day is mainly tied to how time behaves.
Because spacetime is very rigid on everyday scales, we don't notice space itself being bent.
Putting aside the question of whether or not "space" bending is physically obtainable, let's consider what would happen if we lived in a world where space itself was curved.

## The Curvature and Straightest Paths

For a spacetime with only *spatial* curvature, we can write its distance rule (its "measuring formula") as below[^einstein].
The $i,j,k,\ldots$ latin indices are spatial indices.

[^einstein]: Using Einstein's index notation.

\begin{equation}
    g = -dt^2 + h_{ij} dx^i dx^j
\end{equation}

Here, the rule for measuring distances does not produce what we usually call gravity, since its time-time part is constant[^offdiag].
Nevertheless, there is spatial curvature encoded in the spatial part, $h$.
Since we are playing around here, we'll not be concerned with whether or not $h$ obeys Einstein's equations.
Idealized test particles in this spacetime follow the "straightest possible" paths.
For these particular spacetimes, we can use the $t$ coordinate as the particles' clock.
Their paths can be found by solving the standard equation for "straightest possible motion," written as below.

[^offdiag]: The mixed time-space terms are zero as well.

\begin{equation}
    \frac{d^2 x^i}{dt^2} + \Gamma^i_{jk} \frac{dx^j}{dt}\frac{dx^k}{dt} = 0
\end{equation}

The $\Gamma^i_{jk}$ terms describe how the coordinates themselves "try to bend" your motion due to the curvature of space.
Here $\frac{dx^j}{dt}$ are ordinary velocities, while $\frac{d^2 x^i}{dt^2}$ is the acceleration.
We can rewrite this in a Newton-like form as

\begin{equation}
    m \vec a  =  - m  \vec v^\top \Gamma^i \vec v
\end{equation}

So the $\Gamma$ terms act like a velocity-dependent force.

## Absolute Velocity

I mentioned before that the $\Gamma$ terms behave like an "extra force."
In everyday Newtonian physics, there are also extra forces that show up only because you chose a rotating or accelerating viewpoint; they disappear if you switch to a non-accelerating viewpoint[^inertial].
So, one might wonder if that is possible here.
Could we pick coordinates so that $\Gamma$ (and the associated effects) vanish?
You can always make them vanish at a *single point*, but you cannot make them vanish *everywhere* if space is truly curved.
The reason is that real curvature is not just the presence of $\Gamma$, but how it changes from place to place.
If the space has nonzero curvature, the $\Gamma$ terms cannot be zero everywhere.

This leads to an interesting consequence: in such a space, motion itself can become detectable.
By looking at an accelerometer, you could tell how fast you are moving.
This is because a real accelerometer is not a point; it has size, and different parts of it would be pulled in slightly different ways (a "stretching/squeezing" effect), which registers as a force.

In General Relativity language, the "straightest" paths correspond to constant-velocity motion.
If you deviate from such a path, you have acceleration; the larger the deviation, the larger the acceleration.
Curvature adds another twist: if you send two nearby particles in the same direction, but separated by some initial distance, the shape of space can make their separation shrink[^positive] or grow[^negative].
Real objects have size, so different parts of the object naturally try to come together[^positive] or pull apart[^negative] as the object moves.
This stretching/compression is captured by what is often called *geodesic deviation*.

[^inertial]: Coordinates moving at constant speed and not accelerating.
[^positive]: positive curvature
[^negative]: negative curvature

## Relative Acceleration (Geodesic Deviation)

We can approximate a 3D body as a small rod with some length $\delta x$, neglecting the other dimensions.
This length is a vector, so it can be represented as $\delta x^i \frac{\partial}{\partial x^i}$.
The relative acceleration between nearby "straightest paths" can be written as

\begin{equation}
    A^d = R^d{}_{abc} T^a T^b \delta x^c
\end{equation}

Here, $T$ is the direction of motion through spacetime.
Since we are considering small scales, the $T$ for both ends is approximately the same.
For our spacetime, we have $T^a = c\delta^a_0 + v^i \frac{\partial}{\partial x^i}$.

\begin{equation}
    A^l = R^l{}_{ijk} v^i v^j \delta x^k
\end{equation}

We can swap indices (to make the interpretation clearer).

\begin{equation}
    A^l = -R^l{}_{ikj} v^i \delta x^k v^j
\end{equation}

So $A$ is the *relative* acceleration of the rod's two ends.
Multiply $A$ by a mass and you get the corresponding force.

## Constant Curvature

To get a feel for this relative acceleration, let's consider the case where $h$ describes a space with constant curvature $K$.
In that case, the spatial curvature takes a simple form:

\begin{equation}
    R^l_{ikj} = K (\delta^l_k h_{ij} - \delta^l_j h_{ik})
\end{equation}

So the relative acceleration simplifies to

\begin{equation}
    A^l = -K (\delta^l_k h_{ij} - \delta^l_j h_{ik}) v^i \delta x^k v^j = -K (\delta x^l v_j v^j - v_k \delta x^k v^l)
\end{equation}

There are two terms; taking our motion to be perpendicular to the rod, we have $v_k \delta x^k = 0$.[^dotproduct]
So our relative acceleration is

[^dotproduct]: Because we are in a curved spacetime, "$v_k \delta x^k$" is essentially a dot product.

\begin{equation}
    A^l = -K \delta x^l v_j v^j = -K \delta x^l |v|^2
\end{equation}

Taking our rod to have a mass $m$, the force is roughly

\begin{equation}
    -mK \delta x^l |v|^2
\end{equation}

For positive curvature $K>0$, this force squeezes inward.
For negative curvature $K<0$, this force stretches outward.
If space were curved strongly enough, this could produce huge stresses on bodies—even at modest speeds.

# Further Reading

1. [Jacobi Field](https://en.wikipedia.org/wiki/Jacobi_field)
1. [Geodesic deviation](https://en.wikipedia.org/wiki/Geodesic_deviation)
1. [Geodesic Equation](https://en.wikipedia.org/wiki/Geodesics_in_general_relativity)
