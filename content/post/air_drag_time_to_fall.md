+++
title = 'Air Drag and the Time to Fall'
date = 2025-11-11T21:22:21+09:00
math = true
draft = true
tags = ["physics", "math", "reddit"]
+++

# Falling Under Air Drag

A classic physics problem is to compute the time $t$ it takes for a particle to fall from a height $h$, under the influence of gravity **and** air resistance. This problem can, perhaps surprisingly, be solved analytically with only a handful of steps.

Let's assume a particle dropped from rest (initial velocity zero), subject to gravity $g$ and a drag force proportional to $v|v|$. That is, the force can be written as

$$
\frac{dv}{dt} = -g + k v^2,
$$

where $v$ is the velocity (positive downward), $k$ is the drag coefficient, and $g$ is the acceleration due to gravity. For convenience, we take upward as the positive $y$ axis, so falling downward corresponds to negative $v$.

## Solving the Equation of Motion

**Step 1: Separate variables and solve for $v(t)$.**

The differential equation is:

$$
\frac{dv}{dt} = -g + k v^2
$$

Let us write $v$ as a function of $t$:
Separate variables,

$$
\int \frac{dv}{-g + k v^2} = \int dt
$$

This integrates to

$$
t = -\frac{1}{\sqrt{gk}} \, \mathrm{arctanh} \left( \sqrt{\frac{k}{g}} v \right)
$$

Solving for $v$ gives

$$
v(t) = -\sqrt{\frac{g}{k}} \tanh \left( \sqrt{gk} t \right)
$$

Here, as $t \to \infty$, $\tanh(x) \to 1$, so the terminal velocity is $-\sqrt{g/k}$, as expected.

**Step 2: Integrate again to get position $y(t)$.**

We have

$$
v = \frac{dy}{dt} = -\sqrt{\frac{g}{k}}\tanh\left( \sqrt{gk} t \right)
$$

So

$$
\frac{dy}{dt} = -\sqrt{\frac{g}{k}} \tanh(\sqrt{gk} t)
$$

Integrate both sides:

$$
y(t) = -\frac{1}{k} \ln\left[ \cosh(\sqrt{gk} t) \right] + h
$$

where $h$ is the initial height. At $t = 0$, $y(0) = h$, and $\ln(\cosh(0)) = 0$.

# Time to Hit the Ground

Now, let us solve for the time $t_f$ such that $y(t_f) = 0$ (the ground):

$$
0 = -\frac{1}{k} \ln \left[ \cosh(\sqrt{gk} t_f) \right] + h
$$

Rearrange:

$$
\frac{1}{k} \ln \left[ \cosh(\sqrt{gk} t_f) \right] = h \\
\ln \left[ \cosh(\sqrt{gk} t_f) \right] = h k \\
\cosh(\sqrt{gk} t_f) = e^{hk} \\
\sqrt{gk} t_f = \mathrm{arccosh} ( e^{hk} ) \\
t_f = \frac{ \mathrm{arccosh}(e^{hk}) }{ \sqrt{gk} }
$$

This is the **exact analytic time to reach the ground**.

# Limiting Cases (Small and Large Drag)

**Small $hk$ (weak drag):**

Expand $\mathrm{arccosh}(e^{hk})$ around small $hk$:

$$
\mathrm{arccosh}(e^{hk}) \approx \sqrt{2hk}
$$

So

$$
t_f \approx \sqrt{\frac{2h}{g}}
$$

Which is exactly the free-fall time with no air resistance.

**Large $hk$ (strong drag, large $h$):**

For $hk \gg 1$,

$$
\cosh(x) \sim \frac{1}{2} e^{x}
$$

So,

$$
t_f \approx \frac{hk + \ln 2}{\sqrt{gk}}
$$

The dominant term $hk/\sqrt{gk} = \sqrt{\frac{h k}{g}}$ shows the distance divided by terminal speed:

Terminal velocity,

$$
v_{\mathrm{term}} = \sqrt{\frac{g}{k}}
$$

So, for large $h$,

$$
t_f \approx \frac{h}{v_{\mathrm{term}}}
$$

This also makes physical sense: under strong drag, the object quickly reaches terminal velocity and coasts downward at nearly constant speed.

## Summary

- The time to fall from height $h$ under $g$ with quadratic drag is:

  $$
  t_f = \frac{ \operatorname{arccosh}\left( e^{hk} \right) }{ \sqrt{gk} }
  $$

- For small $k$ or $h$, this reduces to the usual free-fall result.
- For large $k$ or $h$, the result is the distance traveled at terminal velocity.

# Taking it further

Let's now assume we start with a non-zero velocity of $v_0$ and position $y_0$.
Now's let's ask the question of when we would hit a height of $0$ assuming it is reachable with the initial conditions.
This problem can be divided into three cases.

1. $v_0 > 0$ and $y_0 < 0$
2. $v_0 > 0$ and $y_0 > 0$
3. $v_0 \leq 0$ and $y_0 < 0$

## Case 1

With $v > 0$, we can write the equation of motion as $\dot v = - g - k v^2$

$$
v = -\sqrt{\frac{g}{k}} \tan \left(\sqrt{gk} t-\tan ^{-1}\left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right)\right)
$$

and integrating get's us $y$.

$$
y - y_0 = \frac{1}{k} \log \left(\cos \left(\sqrt{gk} t-\tan ^{-1}\left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right)\right)\right) + \frac 1{2k} \log \left(1 + \frac{k v_0^2}{g}\right)
$$

We have to be careful about the point where the velocity becomes negative.
At that point the dynamics change and the "tan" becomes a "tanh".
For our case, we just care about reaching $y = 0$.
The top of the trajectory is when $v = 0$.

$$
t = \frac{1}{\sqrt{g k}}\tan^{-1} \left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right)
$$

So we have to hit zero before then so to speak.
Conditioning on $y = 0$ we have

$$
  -y_0 - \frac 1{2k} \log \left(1 + \frac{k v_0^2}{g}\right) = \frac{1}{k} \log \left(\cos \left(\sqrt{gk} t-\tan ^{-1}\left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right)\right)\right) \implies
$$

$$
  t = \frac{1}{\sqrt{gk}} \left( \arccos \left(e^{ -\left( k y_0 + \frac 12 \log \left(1 + \frac{k v_0^2}{g}\right) \right) }\right) + \tan ^{-1}\left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right) \right)
$$

The $\exp$ term is at min $0$.
That is when the argument of the $\arccos$ is 0.
This is when the zenith is exactly $0$ and the $t$ found correlates with the prevoius result.
For the case when we don't barely make it to $y = 0$, the object has a another time to reach the point.
This simply just add the previous result to the max y (hint at time $t = \frac{1}{\sqrt{g k}}\tan^{-1} \left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right)$).

## Case 2

For case 2 we can just add case 1 and time for the object to drop from the zenith the climbed height.

## Case 3

For case 3 we can modify the initial as by adding a non-zero integration constant.

$$
v = \frac{dy}{dt} = -\sqrt{\frac{g}{k}}\tanh\left( \sqrt{gk} t - \mathrm{arctanh}\left( \sqrt{\frac{k}{g}} v_0 \right) \right) 
$$

Cranking the math level we get[^some]

$$
\frac{1}{\sqrt{g k}} \left(\cosh ^{-1}\left(\frac{e^{k y_0}}{\sqrt{1-\frac{
    v_0^2}{g}}}\right)+\tanh ^{-1}\left(\sqrt{\frac{k}{g}} v_0\right) \right)
$$


[^some]: Some math might be wrong

# Further Reading

- Try changing variables to treat other drag forms, e.g., linear drag.
- See [Wikipedia: Terminal Velocity](https://en.wikipedia.org/wiki/Terminal_velocity) for more.
- [ The reddit post that started it all ]( https://www.reddit.com/r/Physics/comments/1ot13c0/comment/no79zy8/ )
