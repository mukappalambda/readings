# The method of Lagrange multipliers

This article presents a self-contained proof of the method of Lagrange multipliers.

$\textbf{Theorem (Method of Lagrange Multipliers)}$

Let $f: \mathbb{R}^n \to \mathbb{R}$ and $\mathbf{g}: \mathbb{R}^n \to \mathbb{R}^m$ are both $\mathcal{C}^1$-functions and $m \le n$. Consider the following optimization problem with equality constraints:

$$
\begin{aligned}
\min_{\mathbf{x}\in\mathbb{R}^n} &\quad f(\mathbf{x}) \\
\text{subject to}&\quad \mathbf{g}(\mathbf{x}) = \mathbf{0}\tag{P}\
\end{aligned}
$$

If $\mathbf{x}^*\in\mathbb{R}^n$ is a _regular_ minimizer for the problem $(P)$, then there exists $\boldsymbol{\lambda^*}\in\mathbb{R}^m$ such that

$$Df(\mathbf{x}^*) + \boldsymbol{\lambda^*}^TD\mathbf{g}(\mathbf{x}^*) = \mathbf{0}^T\tag{1}$$

$\boldsymbol{\lambda^*}$ are referred to as _Lagrange multipliers_. The primary significance of this theorem is that it provides a necessary condition for regular constrained minimizers.

---

$\textbf{Sketch of Proof}$

The equation $(1)$ means that the gradient $\nabla f(\mathbf{x}^*)$ of the objective is a linear combination of gradients of constraints $\nabla g_1(\mathbf{x}^*), \cdots, \nabla g_m(\mathbf{x}^*)$ where $g_1,\cdots, g_m$ are the components of $\mathbf{g}$. Or equivalently,

$$\nabla f(\mathbf{x}^*)\in\text{im}({D\mathbf{g}(\mathbf{x^*})}^T)\tag{2}$$

where $\text{im}(\cdot)$ denotes the image of a linear transformation.

It can be shown that

$$\text{im}({D\mathbf{g}(\mathbf{x^*})}^T) = {\ker(D\mathbf{g}(\mathbf{x^*}))}^{\perp}\tag{3}$$

To claim $(3)$, it suffices to check the following two things:

1. $\text{im}({D\mathbf{g}(\mathbf{x^*})}^T) \subseteq{\ker(D\mathbf{g}(\mathbf{x^*}))}^{\perp}$
2. $\text{rank}(D\mathbf{g}(\mathbf{x^*})^T) = \dim(\ker{D\mathbf{g}(\mathbf{x^*})}^{\perp})$

$1.\quad(\subseteq)$ If $\mathbf{y}\in\text{im}(D\mathbf{g}(\mathbf{x^*})^T)$, then $\mathbf{y} = D\mathbf{g}(\mathbf{x^*})^T(\mathbf{x})$ for some $\mathbf{x}\in\mathbf{R}^m$. For any $\mathbf{v}\in\ker{D\mathbf{g}(\mathbf{x^*})}$, we have $\mathbf{y}\cdot \mathbf{v} = \mathbf{x}\cdot D\mathbf{g}(\mathbf{x^*})\mathbf{v} = \mathbf{y}\cdot\mathbf{0}=0$. $\heartsuit$

$2.\quad\text{rank}(Dg(\mathbf{x^*})^T) = \dim(\ker{Dg(\mathbf{x^*})}^{\perp})$

$\text{rank}(Dg(\mathbf{x^*})^T) = \text{rank}(Dg(\mathbf{x^*}))$ as every matrix and its transpose have the same rank, and $\text{rank}(Dg(\mathbf{x^*})) = m$ by the regularity of $\mathbf{x^*}$. On the other hand, $\dim(\ker{Dg(\mathbf{x^*})}^{\perp}) = n - \dim(\ker{Dg(\mathbf{x^*})}) = n - (n - m)$. $(2)$ is proved. $\heartsuit$

Hence $(3)$ is checked.

With $(3)$, it immediately implies that $(2)$ holds true if and only if the following condition holds true:

$$\nabla f(\mathbf{x}^*)\in{\ker(D\mathbf{g}(\mathbf{x}^*))}^{\perp}\tag{4}$$

Hence the rest of the proof is to show that for each $\mathbf{y}\in\ker(D\mathbf{g}(\mathbf{x}^*))$, we have

$$\nabla f(\mathbf{x}^*)\cdot\mathbf{y} = 0$$

One might naively assume that moving in any direction in the kernel space at a given point is equivalent to moving in the tangent space at that point. However, this is not true in general. It is true only when the Jacobian is full rank (e.g. the kernel can have a larger dimension than the tangent space at singular points). This is the key result that will be used in the main proof:

$\textbf{Theorem 1}$

Let $\mathbf{g}$ be as above and $\mathbf{x}$ is a regular point. Let $S$ be the constraint set:

$$
S = \{\mathbf{x}\in\mathbb{R}^n\mid \mathbf{g}(\mathbf{x})=\mathbf{0}\}
$$

If $\mathbf{y}\in\ker(D\mathbf{g}(\mathbf{x}))$, then there exists a $\mathcal{C^1}$-function $\gamma=\gamma(t)$ in $S$, defined near $t=0$ into $\mathbb{R}^m$, passing through $\mathbf{x}$ with derivative $\mathbf{y}$ at $\mathbf{x}$.

The power of this theorem is to characterize the tangent vectors at a regular point on a constraint set. And its proof relies on the implicit function theorem.

$\textbf{Proof of Theorem 1}$

Since $\mathbf{x}$ is regular, the gradients $\nabla g_1(\mathbf{x}),\cdots,\nabla g_m(\mathbf{x})$ are linearly independent. Express $\mathbf{x} = (\mathbf{a}, \mathbf{b})$ where $\mathbf{a}\in\mathbb{R}^m$ and $\mathbf{b}\in\mathbb{R}^{n-m}$. By relabeling the indices of $\mathbf{x}$ in such a way that the left-hand $m\times m$ submatrix of $D\mathbf{g}(\mathbf{x})$ is invertible.

By the implicit function theorem, there exists an open neighborhood $W\subseteq\mathbb{R}^{n-m}$ of $\mathbf{b}$ and a $\mathcal{C}^1$-function $\mathbf{h}: W\to \mathbb{R}^m$ with $\mathbf{h}(\mathbf{b}) = \mathbf{a}$ having the following property:

$$
\mathbf{g}(\mathbf{h}(\mathbf{w}), \mathbf{w}) = 0\quad\forall \mathbf{w}\in W
$$

Define $\varphi: W\to\mathbb{R}^n$ by $\mathbf{w}\mapsto (\mathbf{h}(\mathbf{w}), \mathbf{w})$, then

$$\mathbf{g}(\varphi(\mathbf{w})) = \mathbf{g}((\mathbf{h}(\mathbf{w}), \mathbf{w})) = \mathbf{0}\quad\forall \mathbf{w}\in W\tag{1.1}$$

Note that $\varphi(\mathbf{b}) = (\mathbf{h}(\mathbf{b}), \mathbf{b}) = \mathbf{x}$.

By the chain rule, it follows from $(1.1)$ that

$$
D\mathbf{g}(\varphi(\mathbf{w}))D\varphi(\mathbf{w}) = \mathbf{0}\quad\forall\mathbf{w}\in W\tag{1.2}
$$

From the definition of $\varphi$,

$$
D\varphi(\mathbf{w})\mathbf{w'} = (D\mathbf{h}(\mathbf{w})\mathbf{w'}, \mathbf{w'})\quad\forall\mathbf{w, w'}\in W\tag{1.3}
$$

In particular, by letting $\mathbf{w} = \mathbf{b}$ in $(1.2)$, we obtain

$$
\text{im}D\varphi(\mathbf{b})\subseteq\ker{D\mathbf{g}(\varphi(\mathbf{b}))} = \ker{D\mathbf{g}(\mathbf{x})}\tag{1.4}
$$

The dimension $\text{rank}(D\varphi(\mathbf{b}))$ is at least $n-m$ due to $(1.3)$, and the dimension $\text{nullity}(D\mathbf{g}(x))$ is also $n-m$ by the nullity-rank theorem and the regularity of $\mathbf{x}$. Hence the relation in $(1.4)$ is an equality:

$$
\text{im}D\varphi(\mathbf{b}) = \ker{D\mathbf{g}(\mathbf{x})}\tag{1.5}
$$

Write $\mathbf{y} = (\mathbf{k}, \mathbf{l})$ where $\mathbf{k}\in\mathbb{R}^m$ and $\mathbf{l}\in\mathbb{R}^{n-m}$. By $(1.5)$ and $(1.3)$, there exists $\mathbf{w}_0\in W$ such that

$$
\mathbf{y} = D\varphi(\mathbf{b})\mathbf{w}_0 = (D\mathbf{h}(\mathbf{b})\mathbf{w}_0, \mathbf{w}_0)\tag{1.6}
$$

Then it is obvious that $\mathbf{k}=D\mathbf{h}(\mathbf{b})\mathbf{w}_0$, $\mathbf{l}=\mathbf{w}_0$, and we derive from $(1.6)$ that

$$
\mathbf{y} = (D\mathbf{h}(\mathbf{b})\mathbf{l}, \mathbf{l})\tag{1.7}
$$

Define $\gamma = \gamma(t)$ as follows:

$$
\gamma(t) = \varphi(\mathbf{b} + t\mathbf{l}) = (\mathbf{h}(\mathbf{b}+t\mathbf{l}), \mathbf{b}+t\mathbf{l})
$$

Then

$$
\gamma(0) = \varphi(\mathbf{b}) = (\mathbf{h}(\mathbf{b}), \mathbf{b}) = (\mathbf{a}, \mathbf{b}) = \mathbf{x}
$$

and from the chain rule and $(1.7)$,

$$
\gamma'(0) = D\varphi(\mathbf{b})\mathbf{l} = (D\mathbf{h}(\mathbf{b})\mathbf{l}, \mathbf{l}) = (\mathbf{k}, \mathbf{l}) = \mathbf{y}
$$

Now the desired curve $\gamma$ is found and the proof is complete. $\square$

$\textbf{Proof of Method of Lagrange Multipliers}$

Let $\mathbf{y}\in\ker(D\mathbf{g}(\mathbf{x^*}))$. By $\textbf{Theorem 1}$, there exist a curve $\gamma = \gamma(t)$ and $t^*\in\mathbb{R}$ such that

$$\gamma(t^*) = \mathbf{x^*}\quad\text{and}\quad \gamma'(t^*) = \mathbf{y}\tag{5}$$

Consider the real-valued function $\varphi(t) = f(\gamma(t))$ defined near $t=t^*$. $\varphi$ admits its local minimum at $t = t^*$ since $\mathbf{x^*}$ is a minimizer of Problem $(P)$. We have

$$\varphi '(t^*) = 0\tag{6}$$

By the chain rule and $(5)$,

$$\varphi '(t^*) = Df(\gamma(t^*))\gamma'(t^*) = Df(\mathbf{x^*})\mathbf{y}\tag{7}$$

Now $(4)$ is an immediate result of $(6)$ and $(7)$, and this completes the proof. $\square$
