+++
title = 'Air Drag and the Time to Fall'
date = 2025-11-11T21:22:21+09:00
math = true
draft = true
tags = ["physics", "math", "reddit"]
+++

So apparently you can find a more simple solution to time t it takes to fall

In short the solution can be written as t = - arccosh(e^(h k))/sqrt(g k)

where we assume the form of OP's particle under a drag force where dv/dt = - g - k v |v|

h is the initial height. k is the k drag coefficient. g is the acceleration due to gravity. v is the velocity wrt to a coordinate y that is positive increasing upwards. We assume that the inital speed is zero so it simplifies the expression - v |v| to v^2. wlog we assume initial time is t = 0 as well.

First seperation of variables, we can solve change in time such that

dv/dt = - g + k v^2

implies

t = -arctanh(sqrt(k/g) v) / sqrt(g k)

where v is the velocity at time t.

solve for v we get

v = -sqrt(g/k) tanh(sqrt(g k) t)

integrating to get position as a function t we get

y = -1/k ln(cosh(sqrt(g k) t)) + h

Noting that ln(cosh(x)) evaulates at 0 when x = 0.

Finally we can set y = 0 to solve for time t it takes to fall from height h giving us

t = arccosh(e^(hk)) /sqrt(g k)

Expanding around small h k we get at first order

t ~ sqrt(2 h k) / sqrt(g k) = sqrt(2 h / g) (same as no air resistance free fall)

For large h k we have cosh(hk) ~ e^(hk)/2 so

t ~ ln(2 e^(hk)) /sqrt(g k) = ln(2)/sqrt(g k) + (hk)/sqrt(g k) = ln(2)/sqrt(g k) + sqrt(hk/g)

which is consistant with moving at terminal velocity.

I am not sure what OP did but I think they may have overthought this or Wolfraphalpha lead them astray.

