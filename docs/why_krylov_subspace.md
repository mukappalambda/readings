# Why Krylov Subspace?

This note serves to remind me why the [Krylov subspace](https://en.wikipedia.org/wiki/Krylov_subspace) is incredbly popular when it comes to numerical linear algebra.

We want to solve the linear system $Ax = b$ where $A$ is $n\times n$ and $b\in\mathbb{R}^n$. Let $x^*$ be a solution to this linear system. The goal is to claim that $x^*\in \mathcal{K}\stackrel{\mathrm{def}}{=}\text{span}(\{b, Ab, A^2b,\ldots, A^{n-1}b\})$.

To prove this statement, we separate it into two cases:

- Case 1: $A$ is invertible
- Case 2: $A$ is not invertible

But by the end of this note, we will realize that the argument can be simply reduced to _Case 2_. The reason why I still put the _Case 1_ here is because it makes the whole thought more intuitive to me.

---

**Case 1: $A$ is invertible**

In this case, $x^* = A^{-1}b$. Let $f(x)$ be the characteristic polynomial of $A$, by the [Cayley-Hamilton theorem](https://en.wikipedia.org/wiki/Cayley%E2%80%93Hamilton_theorem), $A$ satisfies $f(x)$, i.e, $f(A) = O$, therefore $x^*$ can be expressed as the linear combination of a set of vectors $b, Ab,\ldots, A^{n-1}b$, implying that $x^*\in\mathcal{K}$.

**Case 2: $A$ is not invertible**

In this case, we still want to proceed with the similar trick we've used in _Case 1_. So it urges me to express $x^*$ as $x^* = A^{\dagger}b$ where $A^{\dagger}$ denotes the pseudo-inverse of $A$. Let $A=U\Sigma V^*$ be the singular value decomposition (SVD) of $A$ where $U$ and $V$ and unitary, $\Sigma$ the matrix whose diagonal entries $\sigma_1,\ldots, \sigma_r$ ($r$ being the rank of $A$) the singular values of $A$ sorted in descending order. Then $A^{\dagger}=V\Sigma^{-1}U^*$. Write $b=\sum_{j\le n}\beta_j u_j$ where $\{u_j\}$ are the columns of $U$. Rewerite $x^*$ in vector forms ($\{v_j\}$ the columns of $V$ below), we have

$$x^*=V\Sigma^{-1}U^*b=\left(\sum_{j\le r}\sigma_j^{-1}v_ju_j^*\right)\left(\sum_{j\le n}\beta_j u_j\right)=\sum_{j\le r}\beta_j\sigma_j^{-1}v_j$$

What is $A^kb?$

$$A^kb = \left(\sum_{j\le r}\sigma_j^k u_j v_j^*\right)b=\sum_{j\le r}\sigma_j^k(v_j^*b)u_j$$

To prove that $x^*\in\mathcal{K}$, it suffices to show that $\beta_j\sigma_j^{-1}v_j = c\sigma_j^k(v_j^*b)u_j$ for some $c\in\mathbb{R}$ for every $j\le r$. Or to simplify the notation, $v_j = cu_j$ for some $c$, but it is easily found as we can dot product both sides with $u_j$ and evaluate $c$.

We can immediately recognize that _Case 2_ is actually a generalization of _Case 1_ since every matrix admits the singular value decomposition.

We are now gaining more familiarity with the Krylov subspaces, and we are able to absorb the ideas of the Conjugate Gradient, MINRES, and GMRES algorithms more easily.
