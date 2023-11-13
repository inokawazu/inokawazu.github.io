+++
title = 'Quantum Shoots and Ladders'
date = 2023-11-12T18:07:36+09:00
draft = true
slug = 'quantum-shoots-and-ladders'
math = true
tags = ["quantum", "physics", "linear algebra"]
+++

# Shoots (Snakes) and Ladders

Shoots and ladders is the classic game for kids [^me].
The rules are simple.
Each player starts with their piecies starting at the start of the board.
For each player's turn, they role a six diced dice where the rolled number is the number of spaces to move forward.
To win, you must be the first player to reach the end of the board.
For simplicity, we will consider *reaching the end* as rolling enough to move past the last position.

A certain TODO numberphile video covered this game and made me think about this game.
The video covered transition matrices to answer the question 

> What is the average number roles needed to finish a game shoots and ladders 
> for a particle SLB [^slb]?

I recommend watching the video first, but I will review the needed concepts.

## Transition Matrix

A **transition matrix** ([similar to a stocastic matrix](https://en.wikipedia.org/wiki/Stochastic_matrix)) is a **square** matrix that encodes a transformation of state with some extra conditions.

Let's take a $A_{ij}$ generic square matrix.

We will defined **our** transition matrix $A_{ij}$ must obey the following

1. The sum of each row must be less than or equal to one, $\sum_{i} A_{ij} \leq 1$
    - For $\sum_{i} A_{ij} = 1$, we will call this $A$ unitary.
    - For $\sum_{i} A_{ij} \neq 1$, we will call this $A$ likewise non-unitary.
1. The elements of $A$ must be non-negative, $A_{ij} \geq 0$

We will explain the interpretation below in the section below TODO.

## Geometric Series

A geometric series is a inifite sum defined as (GS).

\begin{equation}
    \sum_{i=0}^\infty r^i = \frac 1{1-r}\text{, if } |r| \lt 1 \tag{GS}.
\end{equation}

For a truncated version (TGS).

\begin{equation}
    \sum_{i=0}^n r^i = \frac {1-r^n}{1-r} \tag{TGS}.
\end{equation}

The above equations are well defined for numbers, but it can be extended to square matrices where $r$ can be replaced with a square matrix, $A$.

<!-- Could --> 
<!-- What would be it's connection with quantum mechanics? --> 
<!-- Its connection -->

[^me]: and me apparently
[^slb]: Snakes and Ladder Board
