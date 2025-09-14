# On Companion Matrices

Let $F$ be a field and $F[x]$ be the polynomial ring in $x$ over $F$.

Let $f(x)\in F[x]$ be a _monic_ polynomial of degree $\deg{f(x)}=n$, write

$$f(x)=x^n+a_{n-1}x^{n-1}+\cdots+a_0\quad (a_i\in F)$$

Define the _companion matrix_ $C$ of $f(x)$ to be the following $n\times n$ matrix

$$
C=\begin{bmatrix}
0 && 0 && \cdots && 0 && -a_0 \\
1 && 0 &&  \cdots && 0 && -a_1 \\
0 && 1 && \cdots && 0 && -a_2 \\
\vdots && \vdots && \ddots && \vdots && \vdots \\
0 && \cdots && \cdots && 1 && a_{n-1}
\end{bmatrix}
$$

and is denoted by $C(f(x))$.

Let $f(x)\in F[x]$ be a monic polynomial and $C=C(f(x))$ be its companion matrix, its characteristic polynomial $\chi_C(x)$ and minimal polynomial $\mu_C(x)$ can be shown to be $f(x)$.

To compute $\chi_C(x)$, expand from the definition of $\chi_C(x)=\det(xI - C)$ and use basic properties of determinant of matrices it can be deduced that $\chi_C(x)=f(x)$. To prove that $\mu_C(x) = f(x)$, suppose that $\deg(\mu_C(x)) = d < n$, then a non-trivial linear combination of the standard basis in $F^n$ can be constructed, which contradicts to the definition of a basis. Hence $d=n$ and $\mu_C(x) = \chi_C(x)$ as $\chi_C(C) = O$ by direct verification where $O = O_{n\times n}$ is the $n\times n$ zero matrix$.

Speaking of the rank of a companion matrix $C=C(f(x))$, it can be immediately summarized as follows:

- If $C$ is non-singular, then $\text{rank}(C) = n$.
- If $C$ is singular (i.e., when $f(0) = a_0 = 0$), then $\text{rank}(C) = n-1$.

Let $C = C(f(x))$ be the companion matrix of a monic $f(x)\in F[x]$, it can be argued that $C$ is the matrix representation of linear operator $T: V \to V$ on a finite-dimensional vector space $V$ over a field $F$ with respect to some ordered basis $\beta$ in $V$. The construction is: let $V=F^n$ and $T:V\to V$ defined by $T(v)=Cv$, the left multiplication of $v$ by $C$. and let $\beta=\{e_1, T(e_1), \cdots, T^{n-1}(e_1)\}$. By the definition of $C$, $beta$ is linearly independent over $F$ and therefore is a basis for $V$. By the definition of the matrix representation,

$$[T]_{\beta} = C(f(x))$$

Let $V$ be a finite-dimensional vector space over $F$ and $T:V\to V$ be a linear operator. Let $v\in V$. consider the $T$-_annihilator_ $\mu_v(x)$ of $v$, the monic polynomial $p(x)\in F[x]$ with minimal degree such that $p(T)v=0$. Let $\mu_v(x) = f(x)$ and $\deg(f(x)) = n$. Consider the set $\beta=\{v, T(v),\ldots,T^{n-1}(v)\}$. Define

$$C_v = \text{span}(\beta)$$

The subspace $C_v$ of $V$ will be called the _cyclic subspace_ of $v$ (in $V$). Note that $C_v$ depends on the underlying $T$ as well but is usually omitted as the linear operator $T$ being discussed is fixed throught the context.

By the definition of $C_v$, $C_v$ is $T$-invariant subspace of $V$. Consider $T|_{C_v}$, the linear operator induced by $T$ on $C_v$. Elementary facts about $T|_{C_v}$ are: the characteristic polynomial $\chi_{T_{C_v}}(x)$ and minimal polynomial $\mu_{T|_{C_v}}(x)$ of $T|_{C_v}$ are the same and equal to $\mu_v(x) = f(x)$. Also by the definition of $\mu_v(x)$ and that of $\mu_T(x)$ and $\chi_T(x)$,

$$\mu_v(x)\mid \mu_T(x), \mu_v(x)\mid \chi_T(x)$$

The importance of companion matrices is that they appear as the building blocks in some matrix representation of a linear operator on a finite-dimensional vector space over a field with respect to a particular basis. Such matrix representations are the so-called _Rational Canonical Forms_, and the existence theorem of such bases is the _Cyclic Decomposition Theorem_.

In essence, to derive the Cyclic Decomposition Theorem, a special case where $\mu_T(x)$ is a power of an irreducible polynomial is being considered first and such well-behaved basis can be obtained. Later one can reduce the general case (no restriction on $\mu_T(x)$) to that special case and assemble those bases together to one for the original vector space.

Let $V$ be a finite-dimensional vector space over F and $T:V \to V$ be a linear operator on $V$. Suppose that $\mu_T(x) = q(x)^m$ where $q(x)$ is a monic irreducible polynomial in $F[x]$. Then there are cyclic subspaces $C_{v_1}, \cdots, C_{v_{\ell}}$ such that $V=\bigoplus_{i=1}^{\ell}{C_{v_i}}$, and $\chi_{T|_{C_{v_i}}}(x) = \mu_{T|_{C_{v_i}}}(x) = q(x)^{m_{i}}$ with $m = m_1 \ge m_2 \ge \cdots \ge m_{\ell}$. Let $\beta$ be the ordered set derived from the cyclic bases of $V_{v_1}, \cdots, V_{v_{\ell}}$, then

$$
[T]_{\beta}=\begin{bmatrix}
C(q(x)^{m_1}) && O &&  O && \cdots && O\\
O && C(q(x)^{m_2}) &&  O && \cdots && O\\
O && O && C(q(x)^{m_2}) && \cdots && O\\
\vdots &&   && && \ddots && \vdots \\
O && \cdots && \cdots && O && C(q(x)^{m_{\ell}})
\end{bmatrix}
$$

To obtain the Cyclic Decomposition Theorem without assuming that $\mu_T(x) = q(x)^m$, a modern proof is to use the _Primary Decomposition Theorem_ to decompose $V$ into a direct sum of $T$-invariant subspaces $W_i$, and consider the linear operator $T|_{W_i}$ induced by $T$ on $W_i$. This consideration recudes to the previous case as $T|_{W_i}$ is now a power of an irreducible polynomial.
