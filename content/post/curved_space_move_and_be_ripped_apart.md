+++
title = 'Curved Space: Move and be Ripped Apart'
date = 2026-02-10 21:14:52+09:00
math = true
draft = true
tags = ["math", "physics"]
+++

# Absolute Velocity[^cinema]

[^cinema]: Cinema

Knowing one's speed is an important in daily life.
A 60 km/hr car is much more dangerous, is much more dangerous than a stationary one.
However, the physically important source of danger here is the relative difference in speed.
Said 60 km/hr car is 60 km/hr faster than you, so any collision (resulting in a large and dangerous acceleration) would feel *not so* great.
If we moved parallel to the car at the same speed, we would find that we could just treat just as a stationary car.
Simply put, absolute speed (*movement*) is undetectable, but relative speed is.

This particular fact was first observed by [Galileo Galilei](https://en.wikipedia.org/wiki/Galileo_Galilei).
[Inside a ship, moving across calm water,](https://en.wikipedia.org/wiki/Galileo%27s_ship) if there were no windows one could not know the ship was moving.
Therefore, is know *local* experiment that could detect this motion.
So, this is why the principle of absolute speed's undetectability is call [Galilean Relativity](https://en.wikipedia.org/wiki/Galilean_invariance)[^galilean].
Later on, Einstein realizes in nature that not only absolute speed is undetectable and for all inertia observers the speed of light is a constant $c = 299,792,458$ m/s.

[^galilean]: Galilean relativity (and later the principle of relativity) implies the conservation of momentum because it's fundamentally a symmetry of nature.

# Curved Space

In 1915, Einstein presented [his theory of relativity](https://en.wikipedia.org/wiki/Theory_of_relativity).
According his theory, gravity is not due to a gravitation field but curvature of space and time itself; space can curve in spatial directions or the temporal direction.
Actually, the aparent gravitation force we experience every day is due to "time" curvature.
Because spacetime is stiff, we don't experience "space" curvature.
Putting aside the question of whether or not "space" curvature is physically obtainable, let's consider the consequence of living in a world with space curvature.

## The Curvature and Geodesics

For a spacetime with purely spatial curvature, we can write it metric tensor as below [^einstein].
The $i,j,k,\ldots$ latin indices are spatial indices.

[^einstein]: Using Einstein's index notation.

\begin{equation}
    g = -dt^2 + h_{ij} dx^i dx^j
\end{equation}

Here there the metric does not exert what we unusually experience as gravity since it's time-time component is constant[^offdiag].
Nevertheless, there is spatial curvature here encoded in the spatial metric, $h$.
Since we are playing around here, we'll not be concered whether or not $h$ satisifes the Einstein field equations.
For observers, point particles, in this spacetime, they follow geodesics.
For these particular spacetimes, we can use the $t$ coordinate as the clock of observers.
These geodesics can be solved for by solving the [geodesic equation](https://en.wikipedia.org/wiki/Geodesics_in_general_relativity), written as below.

[^offdiag]: The off diagonal, time-space, components are zero as well.

\begin{equation}
    \frac{d^2 x^i}{dt^2} + \Gamma^i_{jk} \frac{dx^j}{dt}\frac{dx^k}{dt} = 0
\end{equation}

$\Gamma^i_{jk}$ here are the aparent inertia forces the point observer will experience from motion in this spacetime.
Here $\frac{dx^j}{dt}$ are velocities in the Newtonian sense while $\frac{d^2 x^i}{dt^2}$ is the acceleration.
We can actually write this geodesic equation in the traditional Newtonian form as.

\begin{equation}
    m \vec a  =  - m  \vec v^\top \Gamma^i \vec v
\end{equation}

The Christoffel symbol now a force matrix.

## Absolute Velocity

I mentioned before that the $\Gamma$ was an aparent inertia force.
Similar forces arries in Newtonian mechanics which are genuine inertia forces, that is a force that disappears in internal frames[^inertial].
So, one might wonder if that is possible here.
Could we set inertia coordinates such that $\Gamma$ and the associated forces vanish.
This is actually impossible to do; switch to any frame such that $\Gamma$ vanishes everywhere.
One can see this by considering the fact that the Riemannian curvature tensor depends on the derivative and value of $\Gamma$.
We our metric has non-zero curvature tensor, $\Gamma$ must not vanish everywhere so it does not lead to a contradiction.
It is interesting to then note that, moving in such a space, one can *detect* how fas one is traveling by looking at ones accelerometer.
This is true, really because a real accelerometer would not be a point particle, and experience tidel forces, causing it to measure a force.

In the lingo of General Relativity, straight lines in spacetime are observers moving at a constant velocity.
Any deviation from a straight line is then said to have acceleration, the larger the deviation the larger the acceleration.
The thing about curvature is that if you set two point observers to head in the same direction, but seperated by some initial distance, curvature will either push them together[^positive] or apart[^negative].
Realistic bodies, have some volume, so their individual bits will naturally want to come together[^positive] or apart[^negative] as it moves in space.
This compression/stretching comes from the curvature and is represented by the Jacobi field (geodesic deviation).


[^inertial]: Coordinates moving at constant speed and not accelerating.
[^positive]: positive curvature
[^negative]: negative curvature

## The Jacobi Field

We can approximate a 3D body as a small rod with some length $\delta x$, neglecting the other dimensions.
This length being vectorial quantity, it can be represented as $\delta x^i \frac{\partial}{\partial x^i}$.
The Jacobi field, $A$, on such an object can be written as 

\begin{equation}
    A^d = R^d{}_{abc} T^a T^b \delta x^i
\end{equation}

Here, $T$, is the direction of motion of either end of the object in spacetime.
Since we are considering small scales, the $T$ on both sides is approximately the same.
For our spacetime question $T^a = c\delta^a_0 + v^i \frac{\partial}{\partial x^i}$.

\begin{equation}
    A^l = R^l{}_{ijk} v^i v^j \delta x^k
\end{equation}

We can flip the index (to make the meaning of $A$ clearer).

\begin{equation}
    A^l = -R^l{}_{ikj} v^i \delta x^k v^j
\end{equation}

So, we can see this as the *relative* acceleration of the body's two ends.
Multiply, $A$ by a mass and then you have a force.

## Constant Curvature

To get feel of this relative acceleration, let's consider the case where $h$ is the metric of a space with constant curvature, $K$.
The Riemannian's curvature tensor (spatial components) simplies to

\begin{equation}
    R^l_{ikj} = K (\delta^l_k h_{ij} - \delta^l_j h_{ik})
\end{equation}

So the relative acceleration simplifies to

\begin{equation}
    A^l = -K (\delta^l_k h_{ij} - \delta^l_j h_{ik}) v^i \delta x^k v^j = -K (\delta x^l v_j v^j - v_k \delta x^k v^l)
\end{equation}

There are two terms, taking our movement to be perpendicular to the length of the, we have $v_k \delta x^k = 0$.[^dotproduct]
So our relative acceleration is 

[^dotproduct]: Because we are in a curved spacetime, "$v_k \delta x^k$" is a dot product essentially.

\begin{equation}
    A^l = -K \delta x^l v_j v^j = -K \delta x^l |v|^2
\end{equation}

Taking our bar to have a mass of $m$, the force is roughly

\begin{equation}
    -mK \delta x^l |v|^2
\end{equation}

For positive curvature $K>0$, this force is squeezing/attractive!
For negative curvature $K<0$, this force is stretching/repulstive!
If we have a really curved space, this could cause massive forces and stress on bodies, even for small speeds.

# Further Reading

1. [Jacobi Field](https://en.wikipedia.org/wiki/Jacobi_field)
1. [Geodesic deviation](https://en.wikipedia.org/wiki/Geodesic_deviation)
1. [Geodesic Equation](https://en.wikipedia.org/wiki/Geodesics_in_general_relativity)
