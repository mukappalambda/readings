# On the Kurtosis of a Signal

Kurtosis looks innocent from a statistical perspective, but it is also a powerful tool for detecting rare events in a signal or time series.

Let $(\Omega, \mathcal{F}, \mathbb{P})$ be a probability space, and let $X$ be a random variable. The kurtosis $\text{Kurt}(X)$ is defined as the standardized $4$-th moment:

$$\text{Kurt}(X)\stackrel{\mathrm{def}}{=}\mathbb{E}\left[\left(\frac{X-\mu}{\sigma}\right)^4\right]$$

where $\mu=\mathbb{E}[X]$ and $\sigma = \text{Var}(X)$.

Let $Z\stackrel{\mathrm{def}}{=}\frac{X-\mu}{\sigma}$. From the definition of variance, we have:

$$\text{Kurt}(X) = \mathbb{E}[Z^4]=\text{Var}(Z^2) + \mathbb{E}[Z^2]^2 = \text{Var}(Z^2)+\left(\text{Var}(Z)+\mathbb{E}[Z]^2\right)^2\tag{1}$$

Using the properties of variance again, we obtain $\mathbb{E}[Z]=0$, $\text{Var}(Z) = 1$, and thus $(1)$ becomes

$$\text{Kurt}(X)=\text{Var}(Z^2)+1\tag{2}$$

For example, if $X\sim\mathcal{N}(\mu, \sigma^2)$, then the random variable $Z=\frac{X-\mu}{\sigma}\sim \mathcal{N}(0, 1)$, and the moment generating function of $Z$ is $f_Z(t)=e^{t^2 / 2}$, which gives $\text{Kurt}(X) = \mathbb{E}[Z^4]=f_Z^{(4)}(0)=3$. Sometimes the excess kurtosis of $X$ is defined as the quantity $\text{Kurt}[X] - 3$ so that the excess kurtosis of a normal distribution is zero.

Kurtosis is invariant under affine transformations, meaning that if $Y = aX + b$ and $a\ne 0$, then $\text{Kurt}(Y) = \text{Kurt}(X)$. This is straightforward: $\mathbb{E}[Y] = a\mathbb{E}[X] + b$ and $\text{Var}(Y) = a^2\text{Var}(X)$, so the equality follows directly from the definition. As a special case, $\text{Kurt}(Z) = \text{Kurt}(X)$ when $Z$ is defined as above.

What can we say about bounds on kurtosis? There is an obvious lower bound for kurtosis, namely $1$, but there is no upper bound in general. For instance, let $\varepsilon$ be a positive number, and let $X$ be a random variable such that $X=0$ with probability $1-\varepsilon$ and $\pm a$ with probability $\varepsilon/2$. One can compute that $\mathbb{E}[X] = 0$, $\text{Var}(X)=a^2\varepsilon$, $\mathbb{E}[X^4]=a^4\varepsilon$, and $\text{Kurt}(X) = a^4\varepsilon / a^4\varepsilon^2=1/\varepsilon$. Hence $\text{Kurt}[X]\to\infty$ as $\varepsilon\to 0$. This example also illustrates why kurtosis is useful for detecting rare events, even when the mean and variance behave normally.

One might be tempted to go beyond the fourth moment. For instance, let us consider the standardized $8$-th moment:

$$\beta_8\stackrel{\mathrm{def}}{=}\mathbb{E}\left[\left(\frac{X-\mu}{\sigma}\right)^8\right]$$

For this quantity, we have

$$\begin{align}\beta_8 &=\text{Var}(Z^4)+\mathbb{E}[Z^4]^2 \\ &=\text{Var}(Z^4)+\left(\text{Var}(Z^2)+1\right)^2 \\&= \text{Var}(Z^4)+\text{Kurt}(X)^2\end{align}$$

Also, $\beta_8 = 105$ when $X\sim\mathcal{N}(\mu, \sigma^2)$.

This does not mean that it is always better to use higher moments when identifying rare events, because the error terms are also amplified in real-world applications.

This note is a reminder to myself that this special moment has a stage of its own.
