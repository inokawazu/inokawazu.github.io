+++
title = 'Odds to Pass: Passing Multiple Choice Quizzes with Luck Alone'
date = 2024-01-10
tags = ["math", "blog"]
math = true
slug = 'odds-to-pass'
+++

Tests are one of those necessary evils in the world.
A good test does what the name implies, it tests the knowledge of the person.
Usually this is down to asses progress in a class or for self learning.
Though sometimes this could go wrong (or right, keep reading).

For essay and long form questions, there is a spectrum of right or wrong.
In math and physics and science in general, the dreaded word problem can present many logical traps and common misconception traps.
Crafted well, this allows the self-learns and teachers to understand the knowledge gained.

Nevertheless, for multiple choice quizes, even students who know nothing of the taught material can still pass in principle*.

# Passing with Luck Alone

As the title hinted[^1], multiple choice quizzes can be passed with just guess.
I.e. with luck alone one can pass all their standardized quizzes and tests.
So, the question is why don't people just guess?
We will see for "sizable", passing by luck alone is usually almost guaranteed[^guaranteed] to fail.
Let's do some math so see.

Let's say that our multiple choice tests will have the following format.
Each test will have $N$ questions.
Each question will have $M$ choices, and there is always one correct answer and $M-1$ incorrect answers per question.
You are said to pass a given test if the percent of answers that are correct is equal or greater than some pass or fail threshold, $p$.

## Pure Guessing

If you were to just purely guess, every question has a $1/N$ of being correct.
For a weird test of $p=100\\%$ and $N=1$ and $M=4$, you odds by just guessing is $25\\%$.
This is not so bad for the lazy test taker but this kind of test is unrealistic[^lazy].

Let's now make a cool $N=20$ questions.
In this case, there is only one way to pass the test.
This is because you must answer all the questions correctly.
If you only guess, your chances of passing are $1/4^{ 20 } \approx 9.09\times10^{-11}\\%$.
This is 1 possibility out of all the outcomes which is $4^{20}$ since each question is independent.
This is *almost guaranteed to fail*[^guaranteed].
We can actually calculate the number of question max before pure guessing becomes *almost guaranteed to fail*.
That would be $N$ such thath $1/4^N \leq 10^{-9}$ which implies after some algebra $N = \mathrm{floor}(9 \log(10)/\log(4)) = 14$.
"Quite a bit", so if you are a teacher please feel free to use the below formula to make sure your test is less likely that the lottery by having more than $N_{\mathrm{lotto}}(M)$ question.

$$
    \tag{Lotto}
    N_{\mathrm{lotto}}(M) = \mathrm{floor}(9 \log(10)/\log(M))
$$

## A more realistic test

We can take $p = 60\\%$ which is [the lowest D in the USA](https://en.wikipedia.org/wiki/Academic_grading_in_the_United_States#Grade_conversion).
Intuitively, a student is expected to answer six out of ten questions correctly[^reduce] on average.

For sake of simplicity, let's assume that the number of questions on the test is $N=3$ and number of questions is $M=5$.
For the first question, a fifth of the students that just guess will get a correct answer.
For the second question, a fifth of the stdents who got the first question correct will get the second one correct and the rest will get the second one incorrect. 
This is the similar for the students who got the first question incorrect.
We want a percentage of guessing students who got two questions correct and that percentage is the chance to pass via guessing.

Let's denote students who got the question correct with a $o$ and students answer incorrectly with a $x$.
So students who answered the first two questions correctly but the last one wrong will be denoted by $oox$.

After the first: $o$, $x$  
After the second: $oo$, $ox$, $xo$, $xx$  
After the third: $ooo$, $oxo$, $xoo$, $xxo$, $oox$, $oxx$, $xox$, $xxx$  

Remember the fraction of students that actually get correct answer is $1/5$. 
So the number of $o$'s is weighted by $1/5$ which $x$'s are weighted by $1 - 1/5 = 4/5$.
So $oox$ would be $(1/5)^2\times (4/5) = 4/5^3 = 3.2\\%$, the fraction of students who started, getting this particular test result.
We are interested in the outcomes that resulted in a pass.
These are the cases where there are two or more $o$'s.
We add fractions of students of these cases and we get the chance of passing as $(1/5)^3 + 3 (4/5)(1/5)^2=10.4\\%$.
Not incredibly low odds, but I would not like these chances as a student.
Worse yet for the instructor.
Essetially they would have no way of knowing if around ten percent of their students are just lucky or not; the test does not provide exclude this option as being *almost guaranteed to fail*[^guaranteed].

## Making thing general

To make luck play a smaller role, let's increase the number of questions.
But, even with the last test of just three questions one could see that every question added, doubles the number of possibilities.
We need a general principle to solve this.
Notice that way we calculated was by first counting the number of possibilities of a given number of correct answers.
Then we multiplied, this number of possibilities with the probability of success raised to the number of correct answers and further multiplied by the probability of failure raised to the number of incorrect answers.
Let's say for a given class of possibilities of $N$ questions, we have $c$ number of correct answers.
The probability of this would then be $\mathcal N(c, N) (1/5)^c (4/5)^{N-c}$.
$\mathcal N(c, N)$ is the number of way I can write a string of $x$'s and $o$'s with $c$ number of $o$'s and a string length of $N$.
$\mathcal N(c, N)$ can actually be expressed with the [binomal coefficient](https://en.wikipedia.org/wiki/Binomial_coefficient#Combinatorics_and_statistics)!
See the third item that says 

> There are $\tbinom {n+k}{k}$ strings containing $k$ ones and $n$ zeros.

For us $x$ is "one" and $x$ is "zero", so $\mathcal N(c, N) = \tbinom {N}{c} = \frac{N!}{c!(N-c)!}$.
Now we can sum up all the possibilities per **independent** probabilities of get exactly $c$ correctly for all the $c$ that are more than the minimum number of correct answers to get a passing grade, $c_\mathrm{min}$.

$$
\tag{Pass 1}
P_{\mathrm{pass}} = \sum_{c=c_\mathrm{min}}^N \tbinom {N}{c} (1/5)^c (4/5)^{N-c}
$$

To make this more general we can make the number of choices general as $M$

$$
\tag{Pass 2}
P_{\mathrm{pass}} = \sum_{c=c_\mathrm{min}}^N \tbinom {N}{c} (1/M)^c (1 - 1/M)^{N-c}
$$

### Passing Table and Data {#ptable}

Here is a table of probabilities for $M = 5$.

| N | Probability to pass |
|--------------|:-----:|
| 1 |  20.0% |
| 2 |  4.0% |
| 3 |  10.4% |
| 4 |  2.72% |
| 5 |  5.792% |
| 6 |  1.696% |
| 7 |  0.4672% |
| 8 |  1.041% |
| 9 |  0.3066% |
| 10 |  0.6369% |

To get almost guaranteed to fail via guessing we actually need $N_{\mathrm fail} = 42$.
I would say that this number of questions is not **that** much.

# Beyond Guessing

Of course, no serious test taker would just guess!
But of course guessing represents the ultimate lack of effort.
It makes sense that this should correspond to not passing!
Nevertheless, with effort and preparation this lower bound chance of passing by guessing offers something of a fundamental benchmark to see how well a person has prepared.
This lower bound of $1/M$ chance to answer correctly should be radised by preparation.
This chance can be denoted by $p$ where to answer incorrectly is $q = 1-p$.
By calling answering a question a "trial", actually the probability distrobution of $n$ correct answers out of N questions/"trials" is exactly a [Binomial distribution](https://en.wikipedia.org/wiki/Binomial_distribution).
I encourage readers to check out this link.

Also, consider [my article on transition matrices](/post/quantum-shoots-and-ladders). 
Since answering a question is an **independent** event, transition matrices can be use simulate even more general point schemes where there is a chance of getting more than one point.

# Appendix

Julia code to find for generating the [table](#ptable) of probabilities in markdown.

```julia
M = 5
cmin(N, ppass = 0.6) = ceil(Int, N*ppass)
ppass(N, M) = sum(binomial(N, c) * (1/M)^c * (1-1/M)^(N-c) for c in cmin(N):N)
let
    println("| N | Probability to pass |")
    println("|--------------|:-----:|")
    foreach(1:10) do N
      p = ppass(N, M)
      println("| $N |  $(round(p*100, sigdigits=4))% |")
    end
end
```

Julia for finding the almost guaranteed to fail $N$ in [this section](#ptable).

```julia
M = 5
cmin(N, ppass = 0.6) = ceil(Int, N*ppass)
ppass(N, M) = sum(binomial(N, c) * (1/M)^c * (1-1/M)^(N-c) for c in cmin(N):N)
N = 1
p = ppass(N, M)
while N<1e6 && p > 10e-9
    N += 1
    p = ppass(N, M)
end
println(N)
```

[^1]: Maybe it is also common knowledge 😜. But, bear with me!
[^guaranteed]: Most of the probabilities will not be exactly zero, but if you have more odds of winning the lottery we can say it's *almost guaranteed to fail*, that's about $~10^{-7}\\%$.
[^lazy]: but maybe a lazy TAs idea of homework
[^reduce]: or three out of five 😉
