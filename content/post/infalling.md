+++
title = 'How does it rain on black holes?'
date = 2023-07-19T00:00:00+09:00
math = true
+++

From the perspective of a raindrop, how would it "percive" falling into a black hole?
For super large/massive black holes, it's said that there is "no drama". 
The raindrop should experience it's surroundings as if it was in empty space.
The fact is, even though the black hole is warping space, it's a vaccuum solution to
Einstein's field equations.

Let's lay some ground rules for what we mean by a raindrop. It should be

1. massive,
1. be motionless at the begining of it's journey,
1. and be approximately a point particle.

By "begining of it's journey", this will usually mean "very far away".
Let's start simple however, and consider a raindrop in a Newton's theory of dynamics.

## Newton's Drop

It's well known that due to **energy conservation** the sum of potential energy and kinetic energy of a falling object (our raindrop) is conserved.
For a object falling towards radial object, this mechanical energy can be given by below.

$$E = \frac{m}{2} \dot{r}^2 - \frac{m G}{r}$$

$r$ is the radius from the center and $\dot r$ is the radial velocity. Doing some algebra on below, we can solve for $\dot r$. 

$$\dot{r} = \pm\sqrt{2E/m + 2G/r}$$

We can see that \eqref{eq:newtonvelocity} the more energy, the larger the speed.
Letting, the raindrop start from very far away from, we can see it's energy must be below.

$$\dot{r} = 0 = \pm\sqrt{2E/m + 2G/\infty} = \pm\sqrt{2E/m} \implies E = 0$$

We can see that a raindrop as a speed inversely proportional to the radial distance.

$$\dot r^2 = 2 GM/r$$

As was hypothesized by John Michell in 1783, a dark star is a dense enough object where the radius of the planet is smaller than $$r_s$$ ie $$r_s = 2 GM/c^2$$ [^light].
For a Newtonian point of view we can see that for dense enough objects, at some point in the raindrop's path, it will travel faster than the speed of light. 
Or vice versa, anything close enough below $$r_s$$ cannot escape unless it travels faster than light.
For Newtonian mechanics, there is no speed limit.
Einstein's relativity accurately predites that there is a universal, relative speed of light.
Funnily enough, Einstein's theory predicts the faster than light "radius".
Let's look at Einstein's theory more closely.


## Einstein's Drop

Classically, all solutions to Einsteins equations are represented by metrics.
For a non-spinning (eternal) black hole, it can be modeled using the [Schwarzschild metric][metric] \eqref{eq:metric}.

$$g = -\left(1-{\frac {r_{s}}{r}}\right)c^{2}\,dt^{2}+\left(1-{\frac {r_{s}}{r}}\right)^{-1}\,dr^{2}+r^{2} \left(d\theta^2 + \sin^2(\theta) d\phi^2 \right)$$

$r$ is the [radial coordinate (but not a radius!)](../radial_coordinate) in the metric.
The place where $r=r_s$ is the location of the event horizon.

### Energy  

Just like Newton's the principle of energy conservation[^eincons] can be used.
Let's consider the a raindrop that drops straight down and call it $\gamma$.
We can parameterize it by the time coordiate $t$. 
We set $$\gamma(t) \equiv (t, r(t), \theta_0, \phi_0)$$.
If we assume the drop is in free fall (follows a geodesics), the raindrop has a conserved energy, that does not change along it's trajectory.

$$E = \frac {m c^3\sqrt{ 1-r_s/r }}{\sqrt{c^2 - \dot r^2/(1-r_s/r)^2}}$$

For being far away and still, the energy is found to be $$E = mc^2$$
Therefore, we have the following.

$$\dot r^2 = c^2(r_s/r)(1-r_s/r)^2$$

\eqref{eq:schwarzschildspeed} has a strange feature.
Apparently, raindrop freezes on the event horizon, $$\left.\dot r \right\vert_{r=rs} = 0$$.
This apparent stop is frame related, from an outside view, the drop would appear to slowly approach but never reach the horizon.
This coordinate/observer dependent effect can be seen because the radial-radial component diverges at $$r = r_s$$.
With this we use [Gullstrand–Painlevé coordinates][gwcoords].

### Gullstrand–Painlevé Coordinates

Gullstrand–Painlevé coordinates the time coordinate, $u$ [^wikitime], is switched such that

$$c u = c t - r_s \left(-2y+\ln \left({\frac {y+1}{y-1}}\right)\right)$$

and $y = \sqrt{r/r_s}$.
In these coordinates, the metric is .

$$g=-\left(1-{\frac {r_s}{r}}\right)\,(cdu)^{2}-2{\sqrt {\frac{r_s}{r}}} (cdu) dr+dr^{2}+r^{2} \left(d\theta^2 + \sin^2(\theta) d\phi^2 \right)$$

We can rewrite the the metric speed, with a more explicit notation.

$$\left(\frac{dr}{dt}\right)^2 = c^2(r_s/r)(1-r_s/r)^2$$

The t is an arbitrary clock[^timecoord] that parameterizes the speed.
Instead, let's try $u$ since the the metric in these coordinates is "well-behaved" at the horizon.

From before, we find that[^lazy]

$$\left(\frac{dr}{du} \right)^2 = c^2 \left(\frac{r_s}{r} \right).$$

An this is the same as Section 1. 

# Conclusion

In either Newtonian or Einstein gravity, raindrops individually "feel" the same, but from a third person relative perspective (ie globally), they are very different.
Outside observers would see rain freeze on the surface while Newton's dark star would have a radically different behavior.

<!-- ## Einstein's Raindrop Versus Newton's -->

# Appendix A: Deriving Einstein Drop Energy

To derive the energy, first we start with the Lagrangian for a free particle of mass $m$.

$$L = -mc \sqrt{-\dot\gamma^2}$$
$$= -mc \sqrt{c^2(1-r_s/r) - \dot r^2/(1-r_s/r)}$$

Finding the cannonical radial momentum we get

$$p_r = - \partial L/\partial\dot r = \frac {mc\dot r/(1-r_s/r)}{\sqrt{-\dot\gamma^2}}.$$

Changing to a hamiltonian mechanics, we get

$$E = \dot r p_r - L$$
$$= mc \frac {\dot r^2/(1-r_s/r)}{\sqrt{-\dot\gamma^2}} + mc \sqrt{-\dot\gamma^2}$$
$$= mc \frac {\dot r^2/(1-r_s/r) -\dot\gamma^2}{\sqrt{-\dot\gamma^2}}$$
$$= \frac {m c^3(1-r_s/r)}{\sqrt{-\dot\gamma^2}}$$
$$= \frac {m c^3(1-r_s/r)}{\sqrt{c^2(1-r_s/r) - \dot r^2/(1-r_s/r)}}$$
$$= \frac {m c^3\sqrt{ 1-r_s/r }}{\sqrt{c^2 - \dot r^2/(1-r_s/r)^2}}$$

Since the there is not explicit time dependence there is an energy conservation (the mass does not change).

[metric]: https://en.wikipedia.org/wiki/Schwarzschild_metric
[dark star]: https://en.wikipedia.org/wiki/Dark_star_(Newtonian_mechanics)
[hamiltonian dynamics]: https://en.wikipedia.org/wiki/Hamiltonian_mechanics
[gwcoords]: https://en.wikipedia.org/wiki/Gullstrand%E2%80%93Painlev%C3%A9_coordinates

[^light]: The speed of light is $c$.
[^eincons]: This is the conservation of energy in [hamiltonian dynamics][hamiltonian dynamics]. For general, relativity, stationary spacetimes admit conserved energy along geodesics, see Wald Sec. 6.3.
[^wikitime]: The time coordiate, $u$, is $t_r$ in the [Wikipedia Article][gwcoords].
[^timecoord]: By clock I mean time coordinate.
[^lazy]: I ran through the calculations for the energy. The metric might be wrong (wikipedia is wrong), so I anyone wants to double check me that would be great 😁!
