# Applications of Lagrange Multipliers

The purpose of this note is to present a number of problem classes that can be solved using the method of Lagrange multipliers.

---

## Equality-Constrained Quadratic Programming (ECQP)

Let $Q\in\mathbb{R}^n$ be a symmetric and positive-definite matrix, $c\in\mathbb{R}^n$, $d\in\mathbb{R}$, $A\in\mathbb{R}^{m\times n}, b\in\mathbb{R}^m$ where $m<n$ and $\text{rank}A = m$.

Consider the following minimization problem with equality constraints:

$$
\begin{aligned}
\min_{x\in\mathbb{R}^n} &\quad \frac{1}{2}x^TQx+c^Tx+d \\
\text{subject to}&\quad Ax = b
\end{aligned}
$$

Let

$$f(x)\triangleq \frac{1}{2}x^TQx+c^Tx+d$$

and

$$g(x)\triangleq Ax-b$$

If $x^*\in\mathbb{R}^n$ is a minimizer, then by the method of Lagrange multipliers, there exists $\lambda^*\in\mathbb{R}^m$ such that the dual feasibility equality holds:

$${x^*}^TQ + c^T + {\lambda^*}^TA = 0^T$$

where $0$ on the R.H.S. denotes the zero vector in $\mathbb{R}^n$.

Note that the following facts are being used implicitly:

- $Df(x^*) = \frac{1}{2}{x^*}^T(Q + Q^T) + c^T = {x^*}^TQ + c^T$, and
- $Dg(x^*) = A$

Since $x^*$ by definition is a minimizer, it has to satisfy the primal feasibility equality:

$$Ax^* = b$$

The dual feasibility equality and the symmetry of $Q$ tell us that

$$Qx^* + c + A^T\lambda^* = 0$$

or

$$x^* = -Q^{-1}A^T\lambda^* - Q^{-1}c$$

Substitute the above back to the primal feasibility equality, we have

$$AQ^{-1}A^T\lambda^* = -b - AQ^{-1}c$$

or

$$\lambda^* = -(AQ^{-1}A^T)^{-1}b - (AQ^{-1}A^T)^{-1}AQ^{-1}c$$

Here $AQ^{-1}A^T$ is invertible since $\text{rank}A = m$ and $Q$ is invertible, so is $AQ^{-1}A^T$.

Now $x^*$ has the following form:

$$x^* = Q^{-1}A^T(AQ^{-1}A^T)^{-1}b + Q^{-1}A^T(AQ^{-1}A^T)^{-1}AQ^{-1}c-Q^{-1}c$$

Let's write some Python code to validate this formula.

```python
import numpy as np
from scipy.optimize import OptimizeResult, minimize


def generate_psd(n: int):
    A = np.random.randn(n, n)
    Q = A.T @ A
    return Q


def generate_matrix(size: tuple[int, int]):
    A = np.random.randn(*size)
    return A


def objective(_x, Q, c):
    return 0.5 * _x.T @ Q @ _x + c.T @ _x


def lagrangian(_x, _lambda, Q, c, A, b):
    return 0.5 * _x.T @ Q @ _x + c.T @ _x + _lambda.T @ (A @ _x - b)


def first_ecqp_solver(Q, c, A, b):
    Q_inverse = np.linalg.pinv(Q)
    M = np.linalg.pinv(A @ Q_inverse @ A.T)
    _lambda = -M @ b - M @ A @ Q_inverse @ c
    _x = -Q_inverse @ A.T @ _lambda - Q_inverse @ c
    return _x, _lambda


m, n = 3, 5

Q = generate_psd(n)
c = np.random.randn(n)
A = generate_matrix((m, n))
b = np.random.randn(m)

constraints = [{"type": "eq", "fun": lambda x: A @ x - b}]


def fun(x):
    return objective(x, Q, c)


x0 = np.random.randn(n)
result: OptimizeResult = minimize(fun, x0=x0, constraints=constraints)

_x, _lambda = first_ecqp_solver(Q, c, A, b)

_xstar = result.x

primal_min = result.fun
dual_max = lagrangian(_x=_x, _lambda=_lambda, Q=Q, c=c, A=A, b=b)

print(f"m = {m}; n = {n}")
print(f"primal minimizer by minimize(): {_xstar}")
print(f"primal minimizer by manual computation: {_x}")
print(f"primal min: {primal_min}")
print(f"dual max: {dual_max}")
print(f"duality gap: {primal_min - dual_max}")
```

Paste this code and run it, you would get the similar output as follows:

```console
m = 3; n = 5
primal minimizer by minimize(): [ 1.13225638  0.88939761  1.02840566  2.21816789 -0.45254542]
primal minimizer by manual computation: [ 1.13225633  0.88939765  1.02840563  2.2181678  -0.45254541]
primal min: 1.1312102952306051
dual max: 1.1312102952125787
duality gap: 1.8026469206233742e-11
```

In this code, my implementation `first_ecqp_solver()` is just a PoC used for validating the formula derived, not meant to compete with the battle-tested [minimize()](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.minimize.html) function in `scipy`.

Feel free to tweak values of `m` and `n`, just to make sure the assumption $m < n$ holds.

Here the key points are:

- Two primal minimizers should be numerically the same
- The absolute value of the duality gap should be extremely small (you might encounter the negative duality gap sometimes)

---

## The Minimum-Norm Problem

Let $A$ and $b$ be defined as in the ECQP problem.

Consider the _Minimum-Norm Problem_:

$$
\begin{aligned}
\min_{x\in\mathbb{R}^n} &\quad \|x\| \\
\text{subject to}&\quad Ax = b
\end{aligned}
$$

Note that the objective is not differentiable at $x=0\in\mathbb{R}^n$, one often considers the following problem instead as both problems have the same minimizer:

$$
\begin{aligned}
\min_{x\in\mathbb{R}^n} &\quad \|x\|^2 \\
\text{subject to}&\quad Ax = b
\end{aligned}
$$

This problem is exactly a member of the ECQP class. Setting $Q=I$ and $c=0$, we have:

$$x^* = A^T(AA^T)^{-1}b$$

---

## Orthogonal Projection of a Point Onto the Affine Set

This problem is pretty similar to the minimum-norm problem.

Let $x_0\in\mathbb{R}^n$ be fixed. Consider

$$
\begin{aligned}
\min_{x\in\mathbb{R}^n} &\quad \|x - x_0\|^2 \\
\text{subject to}&\quad Ax = b
\end{aligned}
$$

The constraint $Ax = b$ can be rewritten as $A(x - x_0) = b - Ax_0$. And using the result obtained from the minimum-norm problem, we have

$$x^* = A^T(AA^T)^{-1}(b - Ax_0) + x_0$$

In the case $m = 1$ and $n = 2$, if we let $A = [a_1\ a_2]$ and $x_0 = [u_1\ u_2]^T$, then

$$(AA^T)^{-1} = \frac{1}{a_1^2 + a_2^2}$$

and

$$Ax_0 = a_1u_1 + a_2u_2$$

and the distance $\|x - x_0\|$ has the following form:

$$\|x - x_0\| = \frac{|a_1u_1+a_2u_2 - b|}{\sqrt{a_1^2+a_2^2}}$$

which recovers the formula of [distance from a point to a line](https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line).

---

## The Minimum of the Rayleight Quotient

Given a symmetric matrix $A\in\mathbb{R}^n$ and nonzero $x\in\mathbb{R}^n$, the Rayleight Quotient is defined to be

$$\frac{x^TAx}{x^Tx}$$

Consider the minimization problem:

$$\min_{0\neq x\in\mathbb{R}^n} \quad \frac{x^TAx}{x^Tx}$$

This unconstrained problem can be turned to another minimization problem with the equality constraint:

$$
\begin{aligned}
\min_{x\in\mathbb{R}^n} &\quad x^TAx\\
\text{subject to}&\quad x^Tx = 1
\end{aligned}
$$

If $x^*\in\mathbb{R}^n$ is a minimizer to the above problem, then there exists $\lambda^*\in\mathbb{R}$ such that

$$
2{x^*}^TA - 2\lambda^*{x^*}^T = 0^T
$$

(Notice that $\lambda^*$ is a real number, so $\lambda^* = {\lambda^*}^T$)

which means that

$$Ax^* = \lambda^*x^*$$

Hence $x^*$ is an eigenvector of $A$ and $\lambda^*$ is the eigenvalue of $A$ with respect to $x^*$.

Now the objective evaluated at $x=x^*$ becomes

$${x^*}^TAx^* = {x^*}^T\lambda^*x^* = \lambda^* \|x^*\|^2 = \lambda^*$$

That means that the objective attains its minimum at eigenvectors of $A$ that correspond to the smallest eigenvalues.

---

Strictly speaking, the _Minimum-Norm Problem_ and _Orthogonal Projection of a Point Onto the Affine Set_ are both instances of ECQP problems, so this post does not introduce many distinct problem classes. However, I still present them together because they are merely different faces of the same underlying concept.
