+++
title = 'Water Plugs'
date = 2025-02-22T21:13:45+09:00
tags = ["physics"]
math = true
+++

I think it is interesting to sometimes tackle toy examples.
For a recent project on a gig economy site, I was presented with a particular physical system which had some nice properties.
So here I would like to share with everyone.
The system is quite simple, it's just a vertical cylinder of alternating plugs of water and of air.

![An illustrations of plugs of water where the vertical direction is labeled with x. There are four plugs of water shown.](/img/water_plugs.svg "Plugs of water illustration")

In the figure above we have a four water plugs as shown as a cross section of a tube.
Each has a location marked by a variable $x_i$.
Each plug has a length of $\ell_i$.
Between water plugs we have some air.
The air above the water on the top is the atmosphere and the air below the bottom plug is some pressurized chamber that we control the pressure of.

There might be some interesting dynamics going on here so let's think about the energies involved.

First off, there is a gravitational potential energy.
So every plug of water has some gravitational energy

\begin{equation}
U_{gi} = m g (x_i  - h_0) \equiv m_i g x_i
\end{equation}

where $g$ is the acceleration of gravity, $m_i$ is the mass of the $i^{ th }$ water plug.
If the tube as a cross sectional area of $A$, we could use the density of water, $\rho_W$, to write our water plug masses as $m_i = \rho_W \ell_i A$.
$h_0$ is some reference height but since it does not depend on any dependent variables, we can ignore it.
For this case, we'll ignore the gravitation energy of the air between the plugs, because it is so small compared to the gravitational energy of the water.

Next we can think about the energy of the compression of the air.
According to the first law, the compression of air is associated with it's internal energy:

\begin{equation}
dE_{air} = -p dV \tag{Air First Law}
\end{equation}

for $p$ pressure and change in volume $dV$.
For adiabatic changes of volume (no heat transfer), we can set $p = p_0 (V_0/V)^\gamma$.
Integrating out (Air First Law), we have 

\begin{equation}
E_{air} = \frac{p_0V_0^\gamma}{\gamma - 1} \frac{1}{V^{ \gamma - 1 }}
\end{equation}

where we went ahead and ignored the reference energy term.
For a plug of air between $x_i$ and $x_{i+1}$, we have $V = A(x_{i+1} - x_i - \ell_{i})$,
so for the in-between air pockets we have.

\begin{equation}
E_{air,i} = \frac{p_0V_0^\gamma}{\gamma - 1} \frac{1}{(A(x_{i+1} - x_i - \ell_{i}))^{ \gamma - 1 }}
\end{equation}

We can bundle some constants together so clean things up here where $q = p_0V_0^\gamma/A$ so

\begin{equation}
E_{air,i} = \frac{q}{\gamma - 1} \frac{1}{(x_{i+1} - x_i - \ell_{i})^{ \gamma - 1 }}
\end{equation}

So we can see that the energy diverges if the $\gamma > 1$ and the gap between the water blocks vanishes.

For the top block, it is easy. Since we can consider the atmosphere is approximately infinite, we can treat it's volume as unchanging, so the air energy for the "top" air plug is constant and thus does not affect the dynamics of or set up so we can ignore it.
Similarly, since we control the pressure of the bottom air plug we can simply model it as a external force acting on the bottom plug from below.
The energy of this would be

\begin{equation}
E_{air,1} = -F(t) x_1
\end{equation}

Finally, let's write down the kinetic energy of the water plugs.

\begin{equation}
KE_i = \frac 12 m_i \left( \frac{dx_i}{dt} \right)^2 \equiv \frac 12 m_i \dot x_i^2
\end{equation}

Putting this all together we can write down the Lagrangian.

\begin{equation}
L = \sum_{i}^{N-1}\left( \frac 12 m_i \dot x_i^2 - m_i g x_i \right)
-F x_1
-\sum_{i}^{N-1}\frac{q}{\gamma - 1} \frac{1}{(x_{i+1} - x_i - \ell_{i})^{ \gamma - 1 }}
\end{equation}

Let's do one more thing before I end this article.
Let's write down this Lagrangian terms of unitless quantities!

There are many length scales where so we need to choose one.
One possible length scale is the length of the first water plug.
I will call this length $l := \ell_1$.
For time we could choose in tandem with $l$ and $g$ as $\tau := \sqrt { l/g } = \sqrt{\ell_1/g}$.
This leaves us with mass. Since mass in our setup only comes from water, let's use the mass of the first plug to define a characteristic mass, $\mathcal m := m_1 $.

Now we can replace the all the quantities in our equation with their unitless counterparts.
Like $x\to x l$ and $t \to t \sqrt{l/g}$.

So our Lagrangian becomes

\begin{equation}
L = \sum_{i}^{N-1}\left( \frac 12 m_i \dot x_i^2 - m_i x_i \right)
-F x_1
-\sum_{i}^{N-1}\frac{q}{\gamma - 1} \frac{1}{(x_{i+1} - x_i - \ell_{i})^{ \gamma - 1 }}
\end{equation}

In the [next article](/content/post/plugs_of_water_2) I will try to look at some more in-depth properties of this Lagrangian.
