+++
title = 'Time to Andromeda'
date = 2025-07-20T09:28:01+09:00
math = true
draft = true
tags = ["physics"]
+++

**Part 2 of [this article](/post/time_to_proxima)**

# Traveling in an Expanding Universe

Traveling throughout the Milky Way Galaxy, one can assume a [flat universe](https://en.wikipedia.org/wiki/Minkowski_space).
So we can assume only special relativity to calculate interstellar travel times for all observers [^observers].
This time I want to expand our interstellar travel calculation to the universe scale.
On the universal scale, the universe is not flat however, but is expanding.
We can approximate this expanding universe as a so called [de Sitter](https://en.wikipedia.org/wiki/De_Sitter_space) (dS) spacetime.
Our question is "How long would it take for a spaceship (with constant thrust) to travel to say a nearby Galaxy?".

[^observers]: At least for two observers -- Earth and the spaceship.

# Setting up the Calculation

Since our destination and starting point (Earth) are naturally being pull apart by the spacetime, we need to keep track of their positions.
Of course we have to solve for the trajectory of spaceship too.
Once we have the solutions we can calculate the elapsed time on the ship.

Due to the complexity of including an expanding spacetime, I suspect only numerical solutions will be possible here.
Nevertheless, I can promise some pretty graphs.
Less start wit the action for a massive particle.

$$
S = -mc \int dt \sqrt{-\dot x \cdot \dot x}
$$

where we are taking the derivative wrt $t$ the time parameter of an observer on Earth located at $r=0.
The dot product is done with the metric.

$$
-c^2 ds^2 = -\left(1-\frac {r^2}{r_h^2}\right) c^2 dt^2+\left(1-\frac {r^2}{r_h^2}\right)^{-1}dr^2+r^2d\Omega_2^2
$$
<!-- -c^2 ds^2 = -c^2 dt^2 + a^2(t) (dx^2 + dy^2 + dz^2) -->
<!-- $$ -->
<!-- -c^2 ds^2 = -c^2 dt^2 + \exp(2 t c / \delta) (dx^2 + dy^2 + dz^2) -->
<!-- $$ -->

$t$ is the time for static observer with no spatial velocity.
This can be seen because if we situate Earth at $r = 0$ then we have

$$
-c^2 ds^2 = -c^2 dt^2+dr^2 ~.
$$

$d\Omega_2$ is the metric of a sphere, but since, there will be no rotation, we can ignore this component of the metric.

$$
-ds^2 = -\left(1-{\frac {r^2}{r_h^2}}\right) dt^2+\left(1-{\frac {r^2}{r_h^2}}\right)^{-1} c^{-2} dr^2
$$

Using only 1D of spatial direction, we can write the action as 

$$
S = -mcL \int d\tau \sqrt{-\frac{\dot x^2}{1-\frac{x^2}{\delta ^2}}-\frac{x^2}{\delta ^2}+1}
$$
<!-- \sqrt{1-\exp\left( \frac{2 t}{\delta} \right) \dot x^2} -->

where we introduced some new unitless varaibles.
$r = L x$, $\delta = L r_h$, and $v = c \beta$ where $q$, $\beta$, and $\delta$ are unitless.
The unitless time is expressed as $t = L/c \tau$.

<!-- Where dot here means derivative wrt the $t$. -->
<!-- We can vary the action to get two equations of motion for $t$ and $r$. -->

<!-- $$ -->
<!--  \dot t  = \frac{1}{(1 - x^2/\delta^2)} --> 
<!-- $$ -->

Where we set constant appropriately.
The variation with respect to $x$ gives us

<!-- $$ -->
<!-- \ddot x = -->
<!--  \frac{x \left(\left(\delta ^2-x^2\right)^2-3 \delta ^4 \dot x^2\right)}{\delta^6-\delta ^4 x^2} + --> 
<!-- \alpha\frac{\left(\left(\delta ^2-x^2\right)^2-\delta ^4 \dot x^2\right)^2}{c^2 \delta ^6 \left(\delta ^2-x^2\right)} ~. -->
<!-- $$ -->

$$
\ddot x = 
\frac{x \left(\left(\delta ^2-x^2\right)^2-3 \delta ^4 \dot x^2\right)}{\delta^6-\delta ^4 x^2} + 
\alpha \frac{\left(\left(\delta ^2-x^2\right)^2-\delta ^4 \dot x^2\right)^2}{\delta ^4
    \left(\delta ^2-x^2\right)^2}
$$
<!-- \frac{\dot x \left(e^{\frac{2 t}{\delta }} \dot x^2-2\right)}{\delta } + \alpha e^{-\frac{4 t}{\delta }} \left(e^{\frac{2 t}{\delta }} \dot x^2-1\right)^2 -->

We added the unitless force $\alpha$ which is constant in the rest frame.
This is the flat spacetime.
So in these coordinates, massive objects that are at rest, can stay at $r = 0$ for all $t$.
In other words, this trajectory is a massive [geodesic](https://en.wikipedia.org/wiki/Geodesic)
$r_h$ is the coordinate distance to the [cosmological horizon](https://en.wikipedia.org/wiki/Cosmological_horizon).
The translation of $ds$ to $dt$ is 
$$ \frac{dt}{dt'} \left(1-{\frac {r^2}{r_h^2}}\right) = 1 \implies \frac{dt}{dt'} = \left(1-{\frac {r^2}{r_h^2}}\right)^{-1}$$


<!-- 

$Assumptions = delta > 0 && x[t] < delta  && x[t] > 0

(*
metric = {
{-(1-x[t]^2/delta^2), 0},
{0, (1-x[t]^2/delta^2)^(-1)}
};
*)

metric = {
{-1, 0},
{0, Exp[2t/delta]}
};
%//MatrixForm
%//TeXForm

imet = Inverse[metric]//FullSimplify
%//MatrixForm

xd = {1, x'[t]}
xs = {t, x[t]}

lag = Sqrt[-xd . metric . xd]
%//TeXForm
(* lag  = Series[lag, delta -> Infinity] *) 

 -D[D[lag, x'[t]], t] + D[lag, x[t]]//FullSimplify
noforce = x''[t]/.Solve[% == 0, x''[t]]//FullSimplify//First (* no force *)
someforce = x''[t]/.Solve[%% == Sqrt[-xd . metric . xd] * imet[[2, 2]] * alpha, x''[t]]//FullSimplify//First (* some force *)
TeXForm[%%]
TeXForm[D[%%, alpha]//FullSimplify//Echo]

Series[noforce, {delta, Infinity, 0}]
Series[someforce, {delta, Infinity, 0}]//FullSimplify

Solve[someforce == 0, x'[t]]

- xd . metric .  xd == - metric[[1, 1]]
Solve[%, x'[t]]//FullSimplify

 -->
