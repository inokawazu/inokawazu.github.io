+++
title = 'Hearing the Shape of a Drum'
date = 2026-02-27T20:52:16+09:00
math = true
draft = true
tags = ["math"]
+++

# Hearing the shape of a drum

In [1966](https://en.wikipedia.org/wiki/Hearing_the_shape_of_a_drum), [Mark Kac](https://en.wikipedia.org/wiki/Mark_Kac) proposed the following question.
If one only hear the sound of a drum, could one then know[^deduce] it's shape?
As the problem is formally stated, it was shown in the 1990s by a few Mathematicians that this is not true.
S. J. Chapman noticed that two of the following shapes had the same eigenfreqencies (the acoustic "fingerprint" of the shapes).
Thus this answers no to the question.

[^deduce]: I wanted to say deduce, but it sounded pretentious.

![](https://upload.wikimedia.org/wikipedia/commons/0/01/Isospectral_drums.svg "Two graphs of two dimensional regions that have the same eigenfreqencies.")

I would like to take some time here to put in my two cents, explore [ Spectral geometry ](https://en.wikipedia.org/wiki/Spectral_geometry), and do some recreational programming.
Let's start by understanding the problem in question more mathematically.

# Formal Statement [(paraphrased from Wikipedia)](https://en.wikipedia.org/wiki/Hearing_the_shape_of_a_drum)

Mathematically, we would like to consider a drum with not dispersion streched over a closed shape.
The elastic material is held still at the boundaries.
We call the bouned region $D$ and the boundary $\partial D$.
Approximately, the motion of the membrane obeys a wave equation.
We can seek to find special standing waves with.
This leads to the following eigenvalue problem where $\lambda_n$ denotes the Dirichlet eigenvalues and $u$ is the displaced height of the membrane at a certain location.
These eigenvalues are the proportional to the square of the eigenfreqencies.

\begin{equation}
    \begin{cases}
    \Delta u_n + \lambda_n u_n = 0 \\\\
    u_n|_{\partial D} = 0
    \end{cases}
\end{equation}

Two domains are said to be *isospectral* (or *homophonic*) if they have the same eigenvalues.
The question can be reformulated as follows: what can be inferred about $D$ if one knows only the values of $\lambda_n$? More specifically: are there two distinct domains that are isospectral?

## Cannot Hear a Difference?

Within the model of the problem, only the eigenvalues are considered to determine whether or not two shapes are isospectral.
This is a bit different from what an average person considers to "hear the sound of a drum" to "know the shape".
Think said person without looking at the drum tapping and probing random points on the drum, they can get a set of data.
For each tap they get the set of weights, one for every eigenvalue.
More formally we can say, given an intial profile $v$, the observer hears a signal which has a mix of frequencies weighted by $w_n(u_n, v)$ determined by the initial profile and eigenvectors[^eigenvectors].
Given absolutely large set of intial profiles, we can generalize the problem to say irregardless of how one taps both drums, one cannot hear the difference.
Naively, this would give us a yes answer to the question.
<!-- talk about dirac deltas here -->

[^eigenvectors]: These are the solutions to the eigenvalue problem.

# Further Reading

- [Hearing the shape of a drum (Wikipedia)](https://en.wikipedia.org/wiki/Hearing_the_shape_of_a_drum)
- [Spectral geometry]( https://en.wikipedia.org/wiki/Spectral_geometry )
- [Isospectral or Homophonic](https://en.wikipedia.org/wiki/Isospectral)
