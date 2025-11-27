+++
title = 'Ploting Roots'
date = 2025-11-26T20:58:05+09:00
math = true
draft = false
+++

# Visualizing Roots

After watching a [2loop video](https://www.youtube.com/watch?v=9HIy5dJE-zQ), I decided to write some Julia code to visualize this my self.
Here is the [Pluto notebook](/notebooks/polynomial_root_plots.jl).
With that code I made this pretty visualization.

![Roots from 20 order polynomials.](/img/poly_roots_20.png)

This is actually made with Makie's `datashader` method where 20th roots where solved for all combinations of coefficients of $1$ or $-1$.
The fullsize image can be generated with the [Pluto code](/notebooks/polynomial_root_plots.jl).
