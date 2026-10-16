---
icon: lucide/book-check
---

## Learn by doing

Start with polynomial algebra, then explore stability, robust $\mathcal{H}_\infty$
and $\mathcal{H}_2$ analysis, and $\mathcal{H}_\infty$ state-feedback control.
All six examples include downloadable MATLAB scripts.

---

## 1. Define a polynomial

**Three vertices. Matrix coefficients.**

!!! note

    No solver is needed for this example.

```matlab title="polynomial_example.m"
--8<-- "docs/examples/polynomial_example.m"
```

[:lucide-move-down: Download .m](./examples/polynomial_example.m){ .md-button }

!!! example "What to expect"

    A degree-one polynomial with three 2 × 2 matrix coefficients.
    Retrieve the coefficient of $\alpha_2$ using its exponent vector.

    Expected result -> `[2 1; 1 3]`

---

## 2. Do the algebra

**Add and multiply polynomials.**

!!! note

    No solver is needed for this example.

```matlab title="algebra_example.m"
--8<-- "docs/examples/algebra_example.m"
```

[:lucide-move-down: Download .m](./examples/algebra_example.m){ .md-button }

!!! example "What to expect"

    Add two degree-one polynomials and multiply their matrix coefficients in order. The product has degree two.
    Expected result.

    Expected result -> `[2 2; 3 -1]`

---

## 3. Build a stability LMI

**A common Lyapunov certificate.**

!!! note

      Requires SeDuMi or a different SDP solver that can be selected in `sdpsettings`.

```matlab title="stability_example.m"
--8<-- "docs/examples/stability_example.m"
```

[:lucide-move-down: Download .m](./examples/stability_example.m){ .md-button }

!!! example "What to expect"

    Find a constant symmetric $P$ for a two-vertex continuous-time model.
    Feasibility gives a sufficient certificate of robust stability;
    it is not a necessary test.

    Expected result -> `Feasible; a 2 x 2 matrix P`

## 4. Compute an $\mathcal{H}_\infty$ bound

**Two vertices. Worts-case energy gain.**

!!! note

      Requires SeDuMi or a different SDP solver that can be selected in `sdpsettings`.

```matlab title="hinf_example.m"
--8<-- "docs/examples/hinf_example.m"
```

[:lucide-move-down: Download .m](./examples/hinf_example.m){ .md-button }

!!! info

    See more about the norms in the [MATLAB reference :lucide-move-up-right:](https://www.mathworks.com/help/control/ref/dynamicsystem.norm.html).

!!! example "What to expect"

    For $\dot{x} = A(\alpha)x + B\,w$ and $z = C\,x$, minimize a common bounded-real LMI certificate over a two-vertex polytope.
    The returned square root of `eta` is an upper bound on $\mathcal{H}_\infty$ for every fixed $\alpha$; a common $P$ may be conservative.

    Expected result -> `eta ≈ 1.150002`

## 5. Compute an $\mathcal{H}_2$ bound

**Two vertices. Impulse-response energy.**

!!! note

      Requires SeDuMi or a different SDP solver that can be selected in `sdpsettings`.

```matlab title="h2_example.m"
--8<-- "docs/examples/h2_example.m"
```

[:lucide-move-down: Download .m](./examples/h2_example.m){ .md-button }

!!! info

    See more about the norms in the [MATLAB reference :lucide-move-up-right:](https://www.mathworks.com/help/control/ref/dynamicsystem.norm.html).

!!! example "What to expect"

    Use the same continuous-time system with $D = 0$.
    A common observability-Gramian bound $X$ gives $\mathcal{H}_2 \leq \sqrt{\mathrm{trace}(B^{\top} X B)}$ for every fixed $\alpha$.
    The result bounds the norm, not its square, and may be conservative.

    Expected result -> `eta ≈ 0.825611`

## 6. Design $\mathcal{H}_\infty$ state feedback control

**Robust gain for two vertices.**

!!! note

      Requires SeDuMi or a different SDP solver that can be selected in `sdpsettings`.

```matlab title="state_feedback_hinf_example.m"
--8<-- "docs/examples/state_feedback_hinf_example.m"
```

[:lucide-move-down: Download .m](./examples/state_feedback_hinf_example.m){ .md-button }

!!! info

    See more about the norms in the [MATLAB reference :lucide-move-up-right:](https://www.mathworks.com/help/control/ref/dynamicsystem.norm.html).

!!! example "What to expect"

    Design a constant state-feedback gain $K = ZW^{-1}$ for a two-vertex continuous-time system with uncertain $A$ and $B_u$.
    A common $W$ gives a robust $\mathcal{H}_\infty$ upper bound for every fixed $\alpha$.

    Expected result -> `eta ≈ 0.961973; K = [-806043.8469 -7270023.3120]`
