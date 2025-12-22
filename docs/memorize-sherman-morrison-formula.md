# How to memorize the Sherman-Morrison Formula

The Sherman-Morrison formula tells us how we can find the inverse of the matrix $I_n+M$ in certain situations, where $M$ is of rank one. In the literature, the matrix $M$ is often expressed as the product $uv^T$ of vectors $u$ and $v$ coming from $\mathbb{R}^n$.

This note is not intended to show how to derive the Sherman-Morrison formula in a rigorous fashion. Instead, it serves as a cheatsheet for how one can recall these identities effortlessly in the future. At least, for me.

For the sake of this note being self-contained, the formula are shown below.

**The Sherman-Morrison formula**

Let $A\in\mathbb{R}^{n\times n}$ be an invertible matrix and $u,v\in\mathbb{R}^n$ be vectors. Then the matrix $A+uv^T$ is invertible if and only if the scalar $1+v^TA^{-1}u$ is nonzero. In that case, $\big(A+uv^T\big)^{-1}$ has the explicit form:

$$\big(A+uv^T\big)^{-1} = A^{-1}-\frac{A^{-1}uv^TA^{-1}}{1+v^TA^{-1}u}\tag{1}$$

The equation $(1)$ can be obtained easily once we know what the exact form of $\big(I_n+uv^T\big)^{-1}$ would be like, for $\big(A+uv^T\big)^{-1}$ has the following expression:

$$\big(A+uv^T\big)^{-1}=\big(I_n+A^{-1}uv^T\big)^{-1}A^{-1}\tag{2}$$

Therefore the key fact to deriving $(1)$ reduces to proving the following lemma:

**Lemma**

Let $u,v\in\mathbb{R}^n$ be vectors. Then the matrix $I_n+uv^T$ is invertible if and only if the scalar $1+v^Tu$ is nonzero. In that case, $\big(I_n+uv^T\big)^{-1}$ has the explicit form:

$$\big(I_n+uv^T\big)^{-1} = I_n-\frac{uv^T}{1+v^Tu}\tag{3}$$

**"Deriving" the lemma**

Denote $uv^T$ by $X$. The form $\big(I_n+X\big)^{-1}$ reminds me of expressing this term in another representation. Recalling the Taylor expansion taught in the calculus, I can symbolically write down the following:

$$
\begin{aligned}
(I_n + X)^{-1}&=I_n - X + X^2 - X^3 + \cdots\\
&=I_n - uv^T + uv^Tuv^T - uv^Tuv^Tuv^T + \cdots\\
&=I_n - u(1 - v^Tu + v^Tuv^Tu - v^Tuv^Tuv^Tu + \cdots)v^T\\
&=I_n - u(1 + v^Tu)^{-1}v^T
\end{aligned}
$$

The "derivation" illustrated above is currently the fastest way for me to retrieve the information of Sherman-Morrison formula out of my brain. I hope that this idea is useful for some of the readers as well.
