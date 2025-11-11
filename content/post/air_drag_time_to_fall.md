+++
title = 'Air Drag and the Time to Fall'
date = 2025-11-11T21:22:21+09:00
math = true
draft = true
tags = ["physics", "math", "reddit"]
+++

# Falling Under Air Drag

A classic physics problem is to compute the time $t$ it takes for a particle to fall from a height $h$, under the influence of gravity **and** air resistance. This problem can, perhaps surprisingly, be solved analytically with only a handful of steps.

Let's assume a particle dropped from rest (initial velocity zero), subject to gravity $g$ and a drag force proportional to $v |v|$. That is, the force can be written as

$$
\frac{dv}{dt} = -g - k v |v|.
$$

For an object falling downward ($v < 0$), $-k v |v| = k v^2$ because $v |v| = -v^2$. Thus, for downward motion, our equation is:

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

Let us write $v$ as a function of $t$. Separate variables:

$$
\int \frac{dv}{-g + k v^2} = \int dt
$$

The left side can be evaluated using the standard integral

$$
\int \frac{dx}{a + b x^2} = \frac{1}{\sqrt{-a b}} \arctanh\left(x \sqrt{\frac{b}{-a}}\right), \quad \text{if}\ a<0
$$

Thus, for our constants,

$$
a = -g, \quad b = k,
$$

so

$$
\int \frac{dv}{-g + k v^2} = -\frac{1}{\sqrt{gk}} \arctanh\left( v \sqrt{\frac{k}{g}} \right)
$$

giving

$$
t + C = -\frac{1}{\sqrt{gk}} \arctanh\left( v \sqrt{\frac{k}{g}} \right)
$$

Applying the initial condition $v(0) = 0$ gives $C = 0$. So:

$$
t = -\frac{1}{\sqrt{gk}} \arctanh\left( v \sqrt{\frac{k}{g}} \right)
$$

Solving for $v$ gives

$$
v(t) = -\sqrt{\frac{g}{k}} \tanh\left( \sqrt{gk} t \right)
$$

As $t \to \infty$, $\tanh(x) \to 1$, so the terminal velocity is $-\sqrt{g/k}$, as expected.

**Step 2: Integrate again to get position $y(t)$.**

Recall

$$
v = \frac{dy}{dt} = -\sqrt{\frac{g}{k}}\tanh\left( \sqrt{gk} t \right)
$$

So

$$
\frac{dy}{dt} = -\sqrt{\frac{g}{k}} \tanh(\sqrt{gk} t)
$$

Integrating both sides:

$$
\int dy = -\sqrt{\frac{g}{k}} \int \tanh(\sqrt{gk} t) dt
$$

Recall that

$$
\int \tanh(ax) dx = \frac{1}{a} \ln \cosh(ax)
$$

Therefore,

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

Expand $\mathrm{arccosh}(e^{hk})$ around small $hk$.
Recall that for small $x$, $\arccosh(1 + x) \approx \sqrt{2x}$, and $e^{hk} \approx 1 + hk$. So,

$$
\mathrm{arccosh}(e^{hk}) \approx \sqrt{2hk}
$$

Therefore,

$$
t_f \approx \sqrt{\frac{2h}{g}}
$$

Which is exactly the free-fall time with no air resistance:

$$
y = h - \frac{1}{2} g t^2 \implies t_{ff} = \sqrt{\frac{2h}{g}}
$$

**Large $hk$ (strong drag, large $h$):**

For $hk \gg 1$,

$$
\cosh(x) \sim \frac{1}{2} e^{x}
$$

so $\arccosh(e^{hk}) \approx hk + \ln 2$. Thus,

$$
t_f \approx \frac{hk + \ln 2}{\sqrt{gk}}
$$

The dominant term $hk/\sqrt{gk} = \sqrt{\frac{h k}{g}}$ shows the distance divided by terminal speed.

Recall, terminal velocity:

$$
v_{\mathrm{term}} = -\sqrt{\frac{g}{k}}
$$

So for large $h$,

$$
t_f \approx \frac{h}{|v_{\mathrm{term}}|}
$$

This makes physical sense: under strong drag, the object quickly reaches terminal velocity and coasts downward at nearly constant speed.

## Summary

- The time to fall from height $h$ under $g$ with quadratic drag is:

  $$
  t_f = \frac{ \operatorname{arccosh}\left( e^{hk} \right) }{ \sqrt{gk} }
  $$

- For small $k$ or $h$, this reduces to the usual free-fall result.
- For large $k$ or $h$, the result is the distance traveled at terminal velocity.

# Taking it Further

Let's now assume we start with a non-zero velocity of $v_0$ and initial position $y_0$. Now let's ask the question: *When do we hit a height of $y = 0$*, assuming it is reachable with the initial conditions? This problem can be divided into three cases:

1. $v_0 > 0$ and $y_0 < 0$
2. $v_0 > 0$ and $y_0 > 0$
3. $v_0 \leq 0$ and $y_0 < 0$

## Case 1

For $v_0 > 0$ (initial upward velocity) and $y_0 < 0$, the equation of motion changes sign because the velocity is upward. The drag becomes $-k v^2$. Thus,

$$
\frac{dv}{dt} = -g - k v^2
$$

Integrating, we get:

$$
\int \frac{dv}{-g - k v^2} = \int dt
$$

This has the solution:

$$
v(t) = -\sqrt{\frac{g}{k}} \tan\left( \sqrt{gk} t - \tan^{-1}\left( \frac{\sqrt{k} v_0}{\sqrt{g}} \right) \right)
$$

Integrating again to get $y$ yields:

$$
y - y_0 = \frac{1}{k} \log\left( \cos\left(\sqrt{gk} t - \tan^{-1}\left( \frac{\sqrt{k} v_0}{\sqrt{g}} \right) \right) \right) + \frac{1}{2k} \log\left( 1 + \frac{k v_0^2}{g} \right)
$$

We must be careful about the point where the velocity becomes negative (i.e., at the peak). At that point the dynamics switch form, and the "tan" becomes a "tanh." For our case, we are only interested if the object reaches $y = 0$ before the peak. The top of the trajectory is at $v = 0$:

$$
v = 0 \implies \sqrt{gk} t_{top} - \tan^{-1}\left( \frac{\sqrt{k} v_0}{\sqrt{g}} \right) = 0
  \implies t_{top} = \frac{1}{\sqrt{gk}} \tan^{-1}\left( \frac{\sqrt{k} v_0}{\sqrt{g}} \right)
$$

So, the object reaches $y = 0$ in this regime *only if* this $t$ is sufficient.

Setting $y = 0$, rearrange for $t$:

$$
  -y_0 - \frac 1{2k} \log \left(1 + \frac{k v_0^2}{g}\right) = \frac{1}{k} \log \left(\cos \left(\sqrt{gk} t-\tan ^{-1}\left(\frac{\sqrt{k} v_0}{\sqrt{g}}\right)\right)\right)
$$

Thus,

$$
  t = \frac{1}{\sqrt{gk}} \left( \arccos \left(e^{ -\left( k y_0 + \frac 12 \log( 1 + \frac{k v_0^2}{g} ) \right) }\right) + \tan ^{-1}\left( \frac{\sqrt{k} v_0}{\sqrt{g}} \right) \right)
$$

The $\exp$ term is at minimum $0$ (so the argument of the $\arccos$ is $0$). This is when the zenith is exactly $y = 0$, and this $t$ matches the turning point previously computed. If not, and $y = 0$ is not reached during ascent, simply add the time to descend from the zenith from rest (i.e., use the solution for initial $v_0 = 0$ from maximum $y_{max}$).

## Case 2

For $y_0 > 0$ and $v_0 > 0$ (thrown upward from above ground), just combine the solution from case 1 for the ascent and the standard downward-fall solution (with $v_0 = 0$, starting from the highest reached point).

## Case 3

For $v_0 \leq 0$ and $y_0 < 0$ (already moving downward):

Returning to the earlier result but now with nonzero initial $v_0$, the velocity solution is

$$
v(t) = -\sqrt{\frac{g}{k}}\tanh\left( \sqrt{gk} t - \mathrm{arctanh}\left( \sqrt{ \frac{k}{g} } v_0 \right) \right) 
$$

Integrating this for position, and solving for the hitting time, gives:

$$
y(t) = -\frac{1}{k} \ln\left[\cosh\left(\sqrt{gk} t - \mathrm{arctanh}\left(\sqrt{\frac{k}{g}} v_0 \right)\right)\right] + y_0
$$

Setting $y(t_f) = 0$, we solve for $t_f$:

$$
\frac{1}{k} \ln\left[\cosh\left(\sqrt{gk} t_f - \mathrm{arctanh}\left(\sqrt{\frac{k}{g}} v_0\right)\right)\right] = y_0
$$

$$
\implies \cosh\left(\sqrt{gk} t_f - \mathrm{arctanh}\left(\sqrt{\frac{k}{g}} v_0\right)\right) = e^{k y_0}
$$

$$
\implies \sqrt{gk} t_f - \mathrm{arctanh}\left(\sqrt{\frac{k}{g}} v_0\right) = \cosh^{-1}(e^{k y_0})
$$

$$
\implies t_f = \frac{1}{\sqrt{g k}} \left( \cosh^{-1}\left(\frac{ e^{ k y_0 } }{ \sqrt{ 1 - \frac{ k v_0^2 }{ g } } } \right ) + \mathrm{arctanh}\left( \sqrt{ \frac{k}{g} } v_0 \right) \right)
$$

[^some]: Some math might be wrong 😛

# Further Reading

- Try changing variables to treat other drag forms, e.g., linear drag.
- See [Wikipedia: Terminal Velocity](https://en.wikipedia.org/wiki/Terminal_velocity) for more.
- [The Reddit post that started it all](https://www.reddit.com/r/Physics/comments/1ot13c0/comment/no79zy8/)
