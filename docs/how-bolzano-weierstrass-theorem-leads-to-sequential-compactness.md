# How Bolzano-Weierstrass Theorem Leads to Sequential Compactness

This article starts from the Bolzano-Weierstrass theorem and review the equivalence of compactness and sequential compactness in metric spaces.

The Bolzano-Weierstrass theorem give the sufficient condition for the existence of limit points in $\mathbb{R}$.

**Bolzano-Weierstrass theorem**

Every bounded infinite subset of $\mathbb{R}$ has a limit point.

**Proof**

Let $E$ be a bounded infinite subset of $\mathbb{R}$. Since $E$ is bounded, we can find a cell $I\subseteq\mathbb{R}$ that contains $E$. Since $I$ is compact, and $E$ is an infinite subset of $I$, $E$ has a limit point in $I$. $\square$

There are essentially two facts used in the above proof.

The first fact is a general result from metric spaces:

**Theorem 1**

Every infinite subset $E$ of a compact set $K$ has a limit point in $K$.

**Proof**

Suppose every point of $K$ is not a limit point of $E$. Then for each $p\in K$, there exists a neighborhood $V_p$ of $p$ that contains no points $q\neq p$ of $E$: $(V_p\setminus\{p\})\cap E=\phi$. These neighborhoods $\{V_p\}_{p\in K}$ form an open cover of $K$, and hence $K$ can be covered by a finite subcollection of $\{V_{p_i}\}_{p_i\in K}$, contradicting to the fact that $E$ is infinite. $\square$

And the second fact is a result of cells:

**Theorem 2**

Every cell $I\subseteq\mathbb{R}$ is compact.

The bounded and infinite assumptions in the Bolzano-Weierstrass theorem are both necessary. Take $E=\mathbb{N}$ and $E$ is clearly infinite but has no limit points in $\mathbb{R}$. And any finite subset in $\mathbb{R}$ has no limit points. In fact, the last assertion can be deduced from the following fact:

**Theorem 3**

if $p$ is a limit point of a subset $E$ of a metric space $X$, then every neighborhood of $p$ contains infinitely many points of $E$.

Note that Theorem 1 literally says that: every sequence in a compact set $K$ has a convergent subsequence. A metric space $X$ is said to be *sequentially compact* if every sequence has a convergent subsequence, or equivalently, if every infinite subset has a limit point in $X$. The following theorem is a reformulation of Theorem 1:

**Theorem 4**

Let $X$ be a compact space. Then $X$ is sequentially compact.

The converse of Theorem 4 also holds true:

**Theorem 5**

Let $X$ be a sequentially compact space. Then $X$ is compact.

**Proof**

Let $X$ be a metric space in which every infinite subset has a limit point. Then $X$ is separable by Theorem 6. It follows that every open cover of $X$ has a countable subcover $\{G_n\}_{n\in\mathbb{N}}$. Suppose that $X$ has no finite subcollection of $\{G_n\}$ that covers $X$. Then $F_n \coloneqq (\bigcup_{i=1}^n G_i)^c$ is nonempty for each $n$, and $\bigcap F_n=\phi$.

Let $E$ be a set which contains a point from each $F_n$. $E$ is infinite and hence has a limit point, say $p$. Since $\{G_n\}$ covers $X$, $p\in G_n$ for some $n$, and there is a neighborhood $N_r(p)$ of $p$ that is contained in $G_n$. Since $p$ is a limit point of $E$, $N_r(p)$ contains infinitely many points of $E$. TBD $\square$

**Theorem 6**

Let $X$ be a metric space in which every infinite subset has a limit point. Then $X$ is *separable*, meaning it contains a countable dense subset.

**Proof**

Let $\delta > 0$. Pick $x_1\in X$, choose $x_2\in X$ such that $d(x_1, x_2)\ge \delta$ if possible. Then choose $x_3\in X$ such that $d(x_i, x_3)\ge \delta$ for $i=1, 2$ if possible. Continueing in this fashion, we want to claim that this process will stop after a finite number of steps. For otherwise, these $\{x_n\}$ form an infinite subset in $X$ that has a limit point by assumption, contradicting to Theorem 3. It completes this claim. As a result, $X$ is covered by finitely many neighborhoods of radius $\delta$ whose centers are those $x_n$.

Take $\delta = 1/n$ for $n\in\mathbb{N}$, and let $E$ be the set of those centers chosen in the above manner. $E$ is countable as it is the countable union of finite sets. To show that $E$ is dense in $X$. Let $p\in X$. Let $r>0$ and consider $N_r(p)$. Choose $N\in\mathbb{N}$ such that $r > 1/N$ by the Archimedean property. From the argument just derived, $p$ is in one of the neighborhoods whose radius is less than $1/N$, say $N_{1/N}(x_i)$, proving that $p$ is a limit point of $E$ or $p\in E$ (if $p=x_i$). $\square$
