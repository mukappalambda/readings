# Gumbel distribution and Gumbel-softmax 

## Extreme value distribution

We derive the distribution of max of `n` samples drawn from a distribution in two ways. Let's assume that the pdf of the distribution is given by $p(x)$ and the cdf is given by $F(x)$. Thus means $F'(x) = f(x)$.

**1. A combinatorial way to derive the distribution**

- Probability(max of `n` samples is `M`) 
  - = Probability(`n-1` samples < `M`, one sample is equal to `M`)
  - = ${n\choose n-1}F(M)^{n-1}f(M)$
  - = $nF(M)^{n-1}f(M)$

**2. A calculus centric way to derive the distribution**

- Probability(all `n` samples are less than `M`)
  - = $\text{CDF of (M)}^n$
  - = $F(M)^n$
  - $\Rightarrow \text{PDF of (M) = }$ $nF(M)^{n-1}f(M)$

**Examples**

1. If $p(x)$ is a uniform distribution between `0` and `1` then:
    - Probability(max of `n` samples = `X`) = $nX^{n-1}$

2. If $p(x)$ is an exponential distribution then $p(x) = e^{-x}$ and $P(x) = 1-e^{-x}$. Then:
    - Probability(max of `n` samples = `M`) = $ne^{-M}(1-e^{-M})^n$

## Deriving Gumbel distribution

In the second example, we would like to pick a value of `M` so that the distribution term takes the form of an expression we are all familiar with. Let $M = X + \ln(n)$ for some value $X$. Then we have $e^{-M} = e^{-X}/n$. This gives us:

- Probability(max of `n` samples = $X + \ln(n)$)
  - $= e^{-X}(1 - \frac{e^{-X}}{n})^n$

Now as $n \rightarrow \infty$:

- Probability(max of samples = $X + \ln(n)$) = $e^{-X}e^{-e^{-X}}$
- Probability(all samples $\le X + \ln(n)$) = $e^{-e^{-X}}$ which is the CDF of the above distribution.

More generally, the distribution is parameterized by $\mu, \beta$ like so:

$$P(X;\mu, \beta) = e^{-e^{(x - \mu)/\beta}}$$

## Gumbel reparameterization trick

**Problem**

Given a discrete distribution with probabilities $x_i,\ i=1\ldots n,\ \sum_i {x_i} = 1$, how can we draw samples from this distribution in a differentiable manner? In other words, how can the samples be a function of $x_i$?

**Solution**

Add Gumbel noise to the logits of the distribution and then apply argmax. The Gumbel noise is drawn from a Gumbel distribution with parameters $\mu = 0, \beta = 1$. 

Since argmax is not differentiable, we replace it with softmax. Thus there are two steps to the Gumbel-softmax trick:

1. Draw samples from the Gumbel distribution and add it to the logits of the distribution. The argmax of this array has the same distribution as the original distribution. We will prove it next.

2. Apply softmax to the result instead of argmax to make the operation differentiable.

**Proof of the first point**

We are given the following:

- Logits $x_i,\ i=1\ldots n$ which means $p_i = \frac{e^{x_i}}{\sum_j e^{x_j}}$
- Gumbel noise $g_i$ drawn from $Gumbel(0, 1)$

We want to prove that probability($g_M + x_M$ is the max over $M$) = $p_M$ for some $M$.

- Probability($g_M + x_M$ is the max value)

= $\int_{-\infty}^{\infty} \text{prob} (g_i + x_i \le g_M + x_M) . \text{prob} (g_M) \,dg_M$

= $\int_{-\infty}^{\infty} \prod_{i \ne M} e^{-e^{g_M + x_M - x_i}} e^{-g_M} e^{-e^{-g_M}}   \,dg_M$

= $\int_{-\infty}^{\infty} \prod_{i} e^{-e^{g_M + x_M - x_i}} e^{-g_M}   \,dg_M$

= $\int_{-\infty}^{\infty} \prod_{i} e^{-{e^{-g_M}}{e^{-x_M}}(\sum_i e^x_i)} e^{-g_M}   \,dg_M$

Now substitute $e^{-g_M} = t \Rightarrow e^{-g_M} dg_M = -dt$:

= $\int_{0}^{\infty} e^{-Ct}   \,dt$ where $C = \frac{\sum_i e^x_i}{e^{x_M}}$

 = $\frac{1}{C} = \frac{e^{x_M}}{\sum_i e^x_i} = p_M$

 This completes the proof.

 **Replacing argmax with softmax**

 Note that this still needs argmax which is not differentiable. If we use argmax, the output is a one hot vector. If we use fotmax, the output is a vector which is a function of the logits.

**Example**

We are given the array of logits with Gumbel noise added to them:

$$[x_1, x_2, x_3] + [g_1, g_2, g_3]$$

The argmax of this array may look like:

$$[0, 1, 0]$$

The softmax of this array will look like:

$$[e^{x_1 + g_1}, e^{x_2 + g_2}, e^{x_3 + g_3}]/\sum_i e^{x_i + g_i}$$

This can be used in a neural network to make the operation differentiable. Usually temperature is added to the softmax operation:

$$\text{softmax}([x_1 + g_1, x_2 + g_2, x_3 + g_3]/\tau)$$

where $\tau$ is the temperature parameter.

## A common confusion in Gumbel-softmax

One may ask: why not just use the softmax of the logits directly? Why add Gumbel noise?

The answer to this question comes from the observation that the softmax should converge to argmax as the temperature parameter $\tau$ goes to zero. If we use the softmax of the logits directly with a very small temperature, the output will always converge to the same one hot vector (corresponding to the largest value in the logits). We are not actually sampling from the distribution. If we take the softmax of logits with Gumbel noise, the output will be a sample from the distribution. This is what we want.