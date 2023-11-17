+++
title = 'Quantum Shoots and Ladders'
date = 2023-11-17
slug = 'quantum-shoots-and-ladders'
math = true
tags = ["quantum", "physics", "linear algebra"]
+++

# Shoots (Snakes) and Ladders

Shoots and ladders is the classic game for kids [^me].
The rules are simple.
Each player starts with their pieces starting at the start of the board.
For each player's turn, they role a six diced dice where the rolled number is the number of spaces to move forward.
To win, you must be the first player to reach the end of the board.
For simplicity, we will consider *reaching the end* as rolling enough to move past the last position.

A certain [numberphile video][numberphile] covered this game and made me think about this game.
The video covered transition matrices to answer the question 

> What is the average number roles needed to finish a game shoots and ladders 
> for a particle SLB [^slb]?

I recommend watching the video first, but I will review the needed concepts.

## Transition Matrix

A **transition matrix** ([similar to a stochastic matrix](https://en.wikipedia.org/wiki/Stochastic_matrix)) is a **square** matrix that encodes a transformation of state with some extra conditions.

Let's take a $A_{ij}$ generic square matrix.

We will defined **our** transition matrix $A_{ij}$ must obey the following

1. The sum of each column must be less than or equal to one, $\sum_{i} A_{ij} \leq 1$
    - For $\sum_{i} A_{ij} = 1$, we will call this $A$ an unitary transition matrix.
    - For $\sum_{i} A_{ij} \neq 1$, we will call this $A$ likewise non-unitary.
1. The elements of $A$ must be non-negative, $A_{ij} \geq 0$

We will explain the interpretation below in the section below.

### Unitary Eigenvalues

The nth power, $A^n$, of a transition matrix, $A$, is effectively the transition matrix after n steps.
We can write the diagonlization of $A$ as ${ A = PDP^{\dag} }$.
$P$ are orthonormal eigenvectors so ${ P^\dag = P^{-1} }$.
So, ${ A^n = PD^nP^{\dag} }$. 

We can notice that for non-unitary transition matrices, all the eigenvalues must have absolute values less than one. Otherwise, they would never settle.

For unitary transition matrices, we have the inverse.
The number of players (particles?) is conserved, so after $n$ steps on some state vector, $v$, ${ \sum_i ( A^n v )_i - v_i = 0 }$.
We can sub in the diagonlization so 

$${ \sum_i \left( PD^nP^{\dag} v \right)_i  = \sum_i v_i = \mathrm{const} }$$
$${ \sum_i \left( \left( PD^nP^{\dag} - \mathbb I \right) v \right)_i = 0 }$$
<!-- $${ \sum_i \left( \left( PD^n - P \right) ( P^{\dag}v ) \right)_i = 0 }$$ -->
<!-- $${ \sum_i \left( \left( D^n - \mathbb I \right) w \right)_i = 0 }$$ -->

If $D^n$ only has eigenvalues where $|\lambda|\lt1$, ${ \sum_i( PD^nP^{\dag}v)_i \rightarrow 0}$ as $n\rightarrow\infty$.
This means ${ \sum_i \left( \left( PD^nP^{\dag} - \mathbb I \right) v \right)_i \rightarrow -1 }$. 
This means that there has to be one eigenvalue where $|\lambda| > 1$ but we can restrict this condition to some eigenvalue is unit, $|\lambda| = 1$.

## Geometric Series

A geometric series is a infinite sum defined as (GS).

\begin{equation}
    \sum_{i=0}^\infty r^i = \frac 1{1-r}\text{, if } |r| \lt 1 \tag{GS}.
\end{equation}

For a truncated version (TGS).

\begin{equation}
    \sum_{i=0}^n r^i = \frac {1-r^n}{1-r} \tag{TGS}.
\end{equation}

The above equations are well defined for numbers, but it can be extended to square matrices where $r$ can be replaced with a square matrix, $A$.
(GS) can be used if all the eigenvalues of $A$, $\lambda_i$, have magnitudes less than $1$, $|\lambda_i| \lt 1$ .
Other than taking the direct nth matrix power, $A^n$, we can take the nth power of the $A$ matrix instead.
Let's say that the diagonlization of $A$ is $A = PDP^{-1}$.
It's *obvious* that $A^n = PD^nP^{-1}$.
Here $(D^n)_{ij} =\lambda_i^n \delta _ {ij}$ ( [$\delta$ is the Kronecker delta][kd] ), the components of the nth power of a diagonal matrix is the nth power of it's components. 
If all the $|\lambda_i| \lt 1 $, then we can see that for **non-unitary transition matrices**, (GS) can be used!
On the other hand **unitary transition matrices** cannot be used in (GS). 
They don't "settle" down!

# Understanding the Transition Matrix

To understand transition matrices better let's look at some small example (see [here](https://math.stackexchange.com/questions/867768/geometric-series-of-matrices)).

## 2x2 SLB with a Coin

Let's make a $4\times4$ transition matrix for a SLB, called $S_1$.

$$
S_1 = \begin{bmatrix} \tag{S1}
1/2 & 0 & 0 & 0 \\\\
1/2 & 1/2 & 0 & 0 \\\\
0 & 1/2 & 1/2 & 0 \\\\
0 & 0 & 1/2 & 1/2
\end{bmatrix}
$$

(S1) is a transition for a altered game of SL. Instead of a d6, we have a **coin**.
On a heads you move forward one square, don't move otherwise.
The SLB is 2x2 in dimensions.
One can see that (S1) is **non-unitary transition matrix** since the last column sums to $1/2$.

We can represent the superposition of a player buy a vector that sums up to one, (V1).

$$ \tag{V1} v_1 \text{ st. } \sum_{i} v_{1i} \leq 1 $$

Every component is the probability, the player at the ith position.
We can represent the initial setup as (V1 Start).

$$\tag{V1 Start}
v_1 = \begin{bmatrix}
1 \\\\
0 \\\\
0 \\\\
0 \\\\
\end{bmatrix}
$$

Applying (S1) by matrix multiplication we find that the resulting vector is the probability distribution of the player after one move.

$$
S_1 v_1 = \begin{bmatrix}
1/2 \\\\
1/2 \\\\
0 \\\\
0 \\\\
\end{bmatrix}
$$

After $n$ moves we can write the resulting vector as $S_1^n v_1$.

Using the "[numberphile]" formula, we find the average number of moves is the some of $v_\mathrm{ave}$ where $(\mathbb I-S_1) v_\mathrm{ave} = v_1$. We find that 

$$
v_\mathrm{ave} = 
\begin{bmatrix}
2 \\\\
2 \\\\
2 \\\\
2 \\\\
\end{bmatrix} \.
$$

The average number of turns turns out to be **$6$**.

# 4x4 SLB with d3

Let's make a SLB for a $4\times4$ board where players use a **d3** instead of a **d6**.
Notice this board is boring in sense like the last one [^forgot], because there are no shoots nor ladders.
But, we will fix this soon enough.
Nevertheless, the $4\times4$ SLB is represented by (S2).

[^forgot]: I forgot to mention that XP.

$$
\begin{bmatrix}
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
\frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
\frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
\frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{3} & \frac{1}{3} & \frac{1}{3} & 0 \\\\
\end{bmatrix} \tag{S2}
$$

The average like before is 

\begin{equation}\notag
v_\mathrm{ave} = \left[
\begin{array}{c}
1.0 \\\\
0.33 \\\\
0.44 \\\\
0.59 \\\\
0.46 \\\\
0.5 \\\\
0.52 \\\\
0.49 \\\\
0.5 \\\\
0.5 \\\\
0.5 \\\\
0.5 \\\\
0.5 \\\\
0.5 \\\\
0.5 \\\\
0.5 \\\\
\end{array}
\right]
\end{equation}

The average number of rolls to end is around $8.33$. 
Of course, the number of turns to out to be longer.

### Adding a Shoot/Snake

Imagine that on the 10th spot we place a shoot that ends on the 4th spot.
This can be done by changing all the positions in (S2) such that the components that represent landing on the 10th position is 0.
The amount of probability is then shifted up to the 4th spot.
Here is the result as (S3).

$$ \tag{S3}
\begin{bmatrix}
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
\frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
\frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
\frac13 & \frac13 & \frac13 & 0 & 0 & 0 & \textcolor{red}{\frac13} & \textcolor{red}{\frac13} & \textcolor{red}{\frac13} & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & \textcolor{red}{0} & \textcolor{red}{0} & \textcolor{red}{0} & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 & 0 \\\\
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & \frac13 & \frac13 & \frac13 & 0 \\\\
\end{bmatrix}
$$

In this case the average number of turns for completion is $11.44$.
It is not surprising that it takes longer!
This addition of a shoot adds a defect to our transition matrix.

# Connection to Quantum Mechanics

SL's connection to quantum mechanics is simple, we can imagine that the player's piece is a particle that randomly moves forward according some transition matrix ([see  numberphile for a larger board][ numberphile ]).

We can imagine that every roll of the dice represents a tic of time as if time was discretized. Starting with some state $v$, we can predict the future probability distribution at some time step $n$. The future nth state is $v_n = A^nv$ where $A$ is some transition matrix.

## Measuring the player

After $n$ moves we can perform a measurement on the player.
This is simply randomly picking a "one-hot" [^onehot] vector depending on the weights of the current state.

For "traditional" [^traditional] we we can think of the [absolute value of of the wave function](https://en.wikipedia.org/wiki/Wave_function#Definition_(one_spinless_particle_in_one_dimension)) as a [probability density](https://en.wikipedia.org/wiki/Probability_density_function).

[^onehot]: A one-hot vector is a vector that is all zeros except for one component.
[^traditional]: "traditional" = non-relativistic

## Differential Time Step

Without explaining the details, we can actually represent a differential time step with the following, equation $A = \exp(i U)$ so $U = -i\log A$.

This form of $A$ in terms of $U$ is convenient for find the nth power of $A$.
It is simply ${ A^n = \exp(i n U) }$ by rules of exponentiation.
Wait, but this $n$ can easily an arbitrary number, $t$! [^time]
So for an arbitrary about of time later we can represent the state of SLB with ${ v_t = \exp(i t U) v_0 }$.

[^time]: $t$ is for time.

# Conclusion

So we've seen how the classic game of Snakes and Ladders can be analyzed using concepts from linear algebra and quantum mechanics. 
We've defined and utilized transition matrices to model the state of the board.
We've also seen parallels between SLB and the principles of quantum mechanics. 
The game's progression over time can be likened to the evolution of a quantum system, with each roll of the dice akin to a discrete "tick" of time. 
I think this is enough I have to say about SL.

# Additional Reading

1. [ The nonnegative inverse eigenvalue problem ](https://www.sciencedirect.com/science/article/pii/S0024379503007985)
    - [Free PDF Version](https://core.ac.uk/download/pdf/81144993.pdf)
1. [ Perron–Frobenius theorem ](https://en.wikipedia.org/wiki/Perron%E2%80%93Frobenius_theorem)
1. [ Stochastic matrix ](https://en.wikipedia.org/wiki/Stochastic_matrix)
1. [On the inverse eigenvalue problem of symmetric nonnegative matrices]( https://link.springer.com/article/10.1007/s40096-019-00311-x )
1. [Nonnegative Inverse Eigenvalue Problem](https://www.intechopen.com/chapters/37787)
1. [Unitarity (physics)](https://en.wikipedia.org/wiki/Unitarity_(physics))
1. [Pluto Notebook with all calculations...](/notebooks/quantum_shoots_and_ladders.jl "SLB Notebook")

[kd]:https://en.wikipedia.org/wiki/Kronecker_delta
[numberphile]:https://www.youtube.com/watch?v=nlm07asSU0c

[^me]: and me apparently
[^slb]: Snakes and Ladder Board
