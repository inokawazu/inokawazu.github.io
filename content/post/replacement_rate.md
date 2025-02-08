+++
title = "Replacement Rate"
date = 2025-02-07T22:24:15+09:00
math = true
+++

There have never been so many people in the world.
Just a few decades ago, there was science fiction about future worlds, crowded with people.
Now, ironically, it's the opposite.
The fertility rate[^frate] is a commonly used term.
It's often said that a fertility rate of 2.1 is needed to sustain a population.
I thought today would be a good opportunity to understand the fertility rate and to understand this replacement rate.
First, I want to introduce a simple population model.
Second, with that model, I want to try to understand the needed fertility rate to achieve a stable population.

[^frate]: The number of children a woman, on average, has in her lifetime.

# The Model

The model is simple. Let's say we have a population that is divided up into age groups.
We can be as coarse or fine-grained here.
I will work with time measurements in years.
So, people who are $t$ years old but not $t+1$ years old will be labeled as $P_t$.
I think it's a bit easier to work with fractions of the total population instead, so let's take $p_t = P_t / P$ as the number of people of a certain age as a fraction of the population.
Furthermore, let's introduce $b_t$ as the fraction of people who give birth[^onegender] at age $t$.
$d_t$ is the fraction of people at age $t$ who perish before their next birthday.
Finally, it makes sense that people cannot have babies right after birth, so let's have a minimum age at which people can start giving birth, $t_b$.

[^onegender]: My world here has only one gender.

<!-- The aim of $b_t$ is to be related to the fertility rate such that, $\sum_{t=0} b_t = B$. -->

Let's introduce the dynamic part of the model.
The age groups the next year are related to the previous population by the following:

\begin{equation}
 \tilde P_{t+1} = (1 - d_t) P_{t} \text{ where } t > 0
\end{equation}

\begin{equation}
 \tilde P_{0} = \sum_{t = t_b} b_t P_{t}
\end{equation}

# Analysis

## Fertility rate

It would be nice to relate our $b$ to the fertility rate, $B$.
Taking the definition of the fertility rate[^frate], we find that it can be calculated as the average number of children a person has over their entire life.
Since we know the rates of death and birth, we can find the chance a person lives to a certain age.
Knowing the chance a person lives to a certain age, we can then perform the average.
So we can define $y_t$ as the probability a person lives to $y_t$ and dies before their next birthday.

For $y_0 = d_0$.
For $y_1 = (1-d_0) d_1$.
For $y_2 = (1-d_0)(1-d_1) d_2$.
Seeing a pattern, we can write $y_t =  d_t\prod_{s = 1}^{t-1} (1 - d_s)$.
As long as $\forall t, |1 - d_t| < 1$, <!-- > --> $y$ over $t$ can be normalized as a probability distribution.

Let's take the case where $d_t = d$, a constant value.
So $y_t = d(1 - d)^t$.

Now let's normalize $y$ by $\sum_t y_t = \sum_t d (1 - d)^t = 1$.
Serendipitously, $y$ is already normalized!
Let's call it $\hat y$ to remind ourselves of this fact.

So now we will calculate the average number of babies a person has, averaging over every possibility.

\begin{equation}
 B = \sum_t \sum_{s=t_b}^t b_s \hat y_t = \sum_{t=t_b} \sum_{s=t_b}^t b_s d (1 - d)^t
\end{equation}

We could take $b_t = b$ to be constant here too with respect to age, so we get

\begin{equation}
 B =  bd\sum_{t=t_b} (t-t_b+1) (1 - d)^t = bd\sum_{r=0} (r+1) (1 - d)^{ r + t_b }
\end{equation}

So we get 

\begin{equation}
 B = b \frac{(1-d)^{t_b}}{d}
\end{equation}

It makes sense that $b=0$ means no births and as $d\to0$, we have a divergence to positive infinity.
We can also calculate the average age lived too.

\begin{equation}
 D = \sum_t t \hat y_t = d \sum_t t (1-d)^t = \frac {1-d}d
\end{equation}

I will leave it to the reader to express $d$ and $b$ in terms of $D$ and $B$.

## Replacement Rate

From the last section, in general for large $B$ and low $D$, the population increases.
If these are too low, the population cannot sustain itself.
What is the sweet spot where the population does not increase nor decrease?
In other words, what should $B$ be, given $D$, so the population is stable?

The most straightforward way is to use the dynamic equations we established and add the constraint that the population does not change, i.e., $\tilde P = P$.
A stricter condition is that every age group does not change. This condition states that the number of people who age out of an age group (or die) is equal to the number of people who age into it.
For age $0$, the people entering are those being born.
Essentially, $\tilde P_t = P_t$.
So we can make a system of equations for $P$!

\begin{equation}
 P_{t+1} = (1 - d_t) P_{t} \text{ where } t > 0
\end{equation}

\begin{equation}
 P_{0} = \sum_{t = t_b} b_t P_{t}
\end{equation}

For simplicity, let's assume again that $d_t$ is a constant value.
Looking at the case of $t>0$ for a few $t$'s, we get:  
$P_{1} = (1-d) P_0$,  
$P_{2} = (1-d)^2 P_0$, and  
$P_{3} = (1-d)^3 P_0$.  

So at least for $t>0$, we can solve recursively for $P_t = (1-d)^t P_0$.
Now we can plug that into our $P_0$ equation (assuming again, like before, that $b_r = b$)!

\begin{equation}
 P_{0} = b \sum_{t = t_b} (1-d)^t P_0 = P_0 \frac{b (1-d)^{t_b}}{d} 
\end{equation}

Solving for $d$, we get $b = \frac{d}{(1-d)^{t_b}}$.
This implies for $B$

\begin{equation}
 B = \frac{d}{(1-d)^{t_b}} \frac{(1-d)^{t_b}}{d} = 1
\end{equation}

Thinking about this result, it makes sense. Everyone needs to replace themselves on average.
If we consider the case where half the population cannot give birth, $b \to b/2$.
Then $B$ becomes $2$.
So, how do people get to the $2.1$ figure?
We could say that $1/2.1$ of the population cannot give birth, but that seems like a cop-out.
Maybe next time we can create a better model.
Or maybe the reader can?

<!-- Let's try making the bith part of our model more complicated. -->
<!-- Let's add the fact that women cannot give birth forever, since they have a finte about of eggs there is an age from after reproduction becomes impossible. -->

<!-- ## Adding a brith age limit -->

<!-- So, to account for this let's say that after some age $t_s$, birth stops person ie for $t > t_s$ $b_t = 0$. -->
<!-- Doing this changes our $B$ to the following -->

<!-- \begin{equation} -->
<!--  B = \frac{b}{d} \left( (d-1) (1-d)^{t_s} (d (t_s-t_b+1)+1)+(1-d)^{t_b} \right) \text{ for } t_s \geq t_b -->
<!-- \end{equation} -->

<!-- Now equilibrium implies that --> 

<!-- \begin{equation} -->
<!--  P_{0} = b \sum_{t = t_b}^{t_s} (1-d)^t P_0 = P_0 b \frac{(1-d)^{t_b}-(1-d)^{t_s+1}}{d} -->
<!-- \end{equation} -->

<!-- This implies that -->

<!-- \begin{equation} -->
<!--  b = \frac{d}{(1-d)^{t_b}-(1-d)^{t_s+1}} -->
<!-- \end{equation} -->

<!-- which implies for $B$ that -->

<!-- \begin{equation} -->
<!--  B = \frac{(d-1) (1-d)^{t_s} (d (t_s-t_b+1)+1)+(1-d)^{t_b}}{(1-d)^{t_b}-(1-d)^{t_s+1}} \text{ for } t_s \geq t_b -->
<!-- \end{equation} -->

<!-- \begin{equation} -->
<!--  B = (1-d)^{t_b} \left( (d-1) (1-d)^{t_s} (d (t_s-t_b+1)+1)+(1-d)^{t_b} \right) \text{ for } t_s \geq t_b -->
<!-- \end{equation} -->


<!-- For replacement rate we want to know the equilibrium point... -->

<!-- makePeqs[maxage_, birthage_] := Table[C[n+1] == (1-dr) C[n], {n, 0, maxage}] ~Join~ {C[0] == Sum[br C[n], {n, birthage, maxage}], Sum[C[n], {n, 0, maxage}] == 1} --> 

<!-- function makepop(maxage, birthage, dr, fertrate; T = Float64) -->
<!--            br = fertrate / (maxage - birthage + 1) -->
<!--            m = zeros(T, maxage + 1, maxage + 1) -->
<!--            # p′j = mji pi -->
<!--            for ((j, agej), (i, agei)) in Iterators.product(enumerate(0:maxage), enumerate(0:maxage)) -->
<!--                if i + 1 == j -->
<!--                    m[j, i] = (1 - dr) -->
<!--                end -->
       
<!--                if agei >= birthage && agej == 0 -->
<!--                    m[j, i] = br -->
<!--                end -->
<!--            end -->
<!--            return m -->
<!--        end -->
