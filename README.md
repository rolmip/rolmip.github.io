# The Robust LMI Parser

## About the Software

ROLMIP (Robust LMI Parser) is a set of programs that works along with the [YALMIP](https://yalmip.github.io) toolbox, and it is designed to work specifically with optimization problems presenting parameter-dependent variables with parameters in the unit simplex. The variables are assumed to depend polynomially on the parameters, being the polynomials considered to be homogeneous. Such optimization problems arise, for example, on the analysis and synthesis conditions related to uncertain continuous or discrete systems, with constraints that are usually defined as Linear Matrix Inequalities (LMIs).

The main objective of ROLMIP is to provide an easy interface for the user, starting from the definition of the variables and going through a straightforward way in defining the LMIs. In addition, once all the variables and LMIs are set they can be converted into a Matlab executable file which solves the same problem but consuming much less time.

The details of ROLMIP can be found in the [User Manual](./docs/manual_rolmip.pdf).

## Download

Download the last ROLMIP version [here](https://github.com/rolmip/rolmip/archive/refs/tags/3.3.zip)!

You may also access the ROLMIP repository [here](https://github.com/rolmip/rolmip) to check prior releases!

## Installation

To install ROLMIP, it suffices to unzip the zip file into a separate folder and then add the folder `rolmip` to MATLAB's path.

## Contact

If you found any bug or have any suggestion to improve the ROLMIP project, don't hesitate to open an issue/pull request or contact us at [agulhari@utfpr.edu.br](mailto:agulhari@utfpr.edu.br)

## Citations

The current version of ROLMIP is free of charge and openly distributed, but if you used ROLMIP (and consequently YALMIP) on your programs, please don't forget to cite us!

Citation for [YALMIP](https://yalmip.github.io/reference/lofberg2004/)

### Citation for ROLMIP:

C. M. Agulhari, A. Felipe, R. C. L. F. Oliveira, and P. L. D. Peres. Algorithm 998: The Robust LMI Parser — A Toolbox to Construct LMI Conditions for Uncertain Systems. ACM Transactions on Mathematical Software, 45(3): 36:1-36:25, August 2019.

### DOI:

http://doi.acm.org/10.1145/3323925

### Bibtex version:

```bibtex
@article{AFOP:19,
  author = {C. M. Agulhari and A. Felipe and R. C. L. F. Oliveira and P. L. D. Peres},
  title = {Algorithm 998: {T}he {R}obust {LMI} {P}arser --- {A} toolbox to construct {LMI} conditions for uncertain systems},
  journal = {ACM Transactions on Mathematical Software},
  volume = {45},
  number = {3},
  pages = {36:1--36:25},
  year  = {2019},
  month = {August},
}
```

## Links

[SeDuMi](http://sedumi.ie.lehigh.edu/)  
[Mosek](https://www.mosek.com/)  
[R-RoMulOC - Randomized and Robust Multi-Objective Control toolbox](http://homepages.laas.fr/peaucell/software.php#romuloc)  
[SOSTools](http://www.cds.caltech.edu/sostools/)

## About the Python implementation

The Python implementation of ROLMIP (RolmiPy) and its core ([PolyAny](https://github.com/rolmip/polyany)) is being developed by [Esdras Battosti](https://github.com/ximiraxelo) and [Cristiano Agulhari](https://github.com/agulhari).

[PolyAny](https://github.com/rolmip/polyany) is a Python package for algebraic manipulation of multivariate polynomials, which will be used to perform internal operations in RolmiPy.

## Acknowledgments

This work is supported by the Brazilian agency CNPq grant 402830/2016-4.
