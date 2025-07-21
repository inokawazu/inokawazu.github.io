+++
title = 'Time to Andromeda'
date = 2025-07-20T09:28:01+09:00
math = true
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

where we are taking the derivative wrt $t$ the time parameter of an observer on
Earth located at $x_i=0$. Static observers in this frame of reference can be
written without any spatial velocity. So we can position the destination at
some coordinate distance along an arbitrary axis, say the  $x$ axis. The dot
product is done with the metric.

$$
-c^2 ds^2 = -c^2 dt^2 + a^2(t) (dx_1^2 + dx_2^2 + dx_3^2)
$$

This metric homogeneous and isotropic.
Ie, there is no special point in the universe.
The unitless $a$ scale factor captures the expansion of the universe.
Using only 1D of spatial direction, we can write the action as 

$$
S = -mcL \int d\tau \sqrt{1-a(t)^2 \dot x^2}
$$

where we introduced some new unitless varaibles.
$x_1 = L x$ and $v = c \beta$ where $q$ and $\beta$ are unitless.
The unitless time is expressed as $t = L/c \tau$ with unitless $\tau$.
$L$ is the spatial coordinate distance to our destination.

Where we set constant appropriately.
The variation with respect to $x$ gives us

$$
\ddot x = 
\frac{\dot a \dot x \left(a^2 \dot x^2-2\right)}{a} + \alpha\left(a\dot x^2-1/a \right)^2
$$

We added the unitless force $\alpha$ which is constant in the rest frame.

Let's put some numbers to our problem!
The nearest galaxy is Andromeda at around $L = 2.50 Mly$ [^Mly].
I know that Andromeda is actually coming towards us, but for sake of this article let's just turn off the attractive force between our two galaxies 😜.
$a$ is related to the Hubble Constant, $H$, as $da/dt/a = H = 0.07/Gyr = 1.75 \times 10^{-4} c/L$.
On this scale, $H$ is small
For Centaurus N -- the furthest nearby galaxy -- $L = 12.3 Mly$, we have $H = 8.616 \times 10^{-4} c/L$.
This is still small.
Nevertheless, the dimensionless force, $\alpha$, will be huge on account of the large distance in $L$.
$\alpha \approx 2.58 \times 10^6$ for Andromeda, and 
$\alpha \approx 1.27 \times 10^7$ for Centaurus N.

In our equation of motion of the ship, a large $\alpha$ would quick accelerte the ship to approximately the speed of light in "no time".
So, the nice thing is that for cosmological scales, we can approx our ship as moving at light speed.
If we did not have any acceleration, we on the other hand treat our spaceship as meaning motionless with respect to the comoving coordinate system.

[^Mly]: Mly is Mega lightyear.

<!-- 

$Assumptions = delta > 0 && x[t] < delta  && x[t] > 0 && a[t] > 0 && h > 0

(*
metric = {
{-(1-x[t]^2/delta^2), 0},
{0, (1-x[t]^2/delta^2)^(-1)}
};
*)

metric = {
{-1, 0}, {0, a[t]^2}
};
%//MatrixForm

imet = Inverse[metric]//FullSimplify
%//MatrixForm

xd = {1, x'[t]}
xs = {t, x[t]}

lag = Sqrt[-xd . metric . xd]
%//TeXForm
(* lag  = Series[lag, delta -> Infinity] *) 

(*
F_a = constant
F_mu = e_mu^a F_a
*)

 -D[D[lag, x'[t]], t] + D[lag, x[t]]//FullSimplify
noforce = x''[t]/.Solve[% == 0, x''[t]]//FullSimplify//First (* no force *)
someforce = x''[t]/.Solve[%% == Sqrt[-xd . metric . xd] * alpha, x''[t]]//FullSimplify//First (* some force *)
TeXForm[%%]
TeXForm[D[%%, alpha]//FullSimplify//Echo]

noforce//ReplaceAll[a->Function[t, 1]]//FullSimplify
someforce//ReplaceAll[a->Function[t, 1]]//FullSimplify

Solve[someforce == 0, x'[t]]

- xd . metric .  xd == - metric[[1, 1]]
Solve[%, x'[t]]//FullSimplify

 -->

# Lightspeed Away!

Calculating time to with lightspeed particles is quite easy.
Using the metric we can directly calcuate the equation of motion.

$$
-1 + a^2(\tau) \dot x^2 = 0 \implies = \dot x = 1/a(\tau)
$$

We can integrate this equation to get the coordinate distance.

$$
\int_0^1 dx = 1 = \int_0^{\Delta \tau} \frac {1}{a(\tau)} d\tau
$$

Taking $a$ to be linear, we can write $a(\tau) = h\tau + 1$.
$h := \left(H \frac Lc\right)$ is the dimensionless version of $H$.
Evaluating the time integral, we have

$$
\int_0^{\Delta \tau} \frac {1}{a(\tau)} d\tau = \frac{\log (h \Delta\tau +1)}{h} = 1
$$

This implies that 

$$\Delta\tau = \frac{e^h-1}{h}$$

Putting back the units we have

$$\Delta t = \frac{e^{HL/c}-1}{H}$$

Taking our universe to be a pure de Sitter space, $a = \exp(t H) \equiv \exp(\tau h)$
Taking same integrals we have

$$\Delta t = \frac{1}{H} \log \left(\frac{c}{c-LH}\right)$$

The first $a$ is a good approximation for our universe at the moment and into the future for sometime.
The second is more accurate for the long run.
An interesting thing to notice is that for a large enough $L$ the time taken goes to infinity.
This is the cosmological horizon, $r_h = c/H \approx 14 Gly$.
This is a pretty large distance.
This length is known as the [ Hubble length ](https://en.wikipedia.org/wiki/Hubble's_law#Hubble_length).

Taking the second $a$, let's calcuate the time to Andromeda.

$$
\Delta t = (Gyr/0.07) \log \left(\frac{1}{1- (2.50 Myr) * (0.07/Gyr)}\right) \approx 0.52 Gyr
$$

About 500 million years...
This might be a few generations of human beings.

If we used the first a it would just be $2.50 Myr$, about the same as just using special relativity.
We can see that exptected the long term de Sitter expansion would make intergalactic travel truely impossible.

Nevertheless, the time on the spaceship would be different from the coordinate $t$ time so perhaps the occupants wouldn't have to go through *that* many generations before arriving at their destination.

<!-- 

tauint = Integrate[1/(h*tau + 1), {tau, 0, tau }]
%//TeXForm

tau/.Solve[tauint == 1, tau]//Last
%//TeXForm


tauint = Integrate[1/Exp[tau h], {tau, 0, tau}]
%//TeXForm

tau/.Solve[tauint == 1//Echo, tau]//Last
%//TeXForm

-->


# Further Reading

- I made a [Pluto notebook](/notebooks/time_to_proxima.jl) thought it was not used in this notebook.
