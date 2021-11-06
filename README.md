## Robust LMI Parser

The last version of ROLMIP can be downloaded [here](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser.zip).

Last Update: 20 October, 2020.


## About the Software

ROLMIP (Robust LMI Parser) is a set of programs that works along with the [YALMIP](https://yalmip.github.io) toolbox, and it is designed to work specifically with optimization problems presenting parameter-dependent variables with parameters in the unit simplex. The variables are assumed to depend polynomially on the parameters, being the polynomials considered to be homogeneous. Such optimization problems arise, for example, on the analysis and synthesis conditions related to uncertain continuous or discrete systems, with constraints that are usually defined as Linear Matrix Inequalities (LMIs).

The main objective of ROLMIP is to provide an easy interface for the user, starting from the definition of the variables and going through a straighforward way in defining the LMIs. In addition, once all the variables and LMIs are set they can be converted into a Matlab executable file which solves the same problem but consuming much less time.

The details of ROLMIP can be found in the [User Manual](https://github.com/rolmip/rolmip.github.io/raw/master/manual_rolmip.pdf).

## Download - New Version!

Download ROLMIP 3.1 [here](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser.zip) !

## Installation

To install ROLMIP in your computer, it suffices to unzip the file "robust_lmi_parser.zip" on a separate folder, and then add this folder on MATLAB's path.

## Versions history

[Version 1.0:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version1_0.zip) First release.<br>
[Version 1.1:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version1_1.zip) Insertion of the syntax to choose, in the polynomial structure definition, to which monomial each matrix is related.
<br>
[Version 2.0:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version2_0.zip) Implementation of the multi-simplex structure; Insertion of the procedure affine2poly.m, to convert an affinely parameter-dependent polynomial into the multi-simplex structure.
<br>
[Version 2.1:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version2_1.zip) Easier definitions for constant matrices using poly_struct; Adaptation of the LMI definitions to the newest YALMIP version (thanks to Hugo Tadashi); Bug corrections.
<br>
[Version 2.2:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version2_2.zip) Bug corrections.
<br>
[Version 2.3:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version2_3.zip) Bug corrections.
<br>
[Version 3.0a:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser_version3_0a.zip) Insertion of the rolmipvar variable, which brings new functionalities; Bug corrections.
<br>
[Version 3.0:](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser.zip) Bug corrections; Manual update.
<br>
[Version 3.1:](https://github.com/rolmip/rolmip.github.io/blob/master/robust_lmi_parser_version_3_1.zip) Bug corrections; Compatibility with Octave.

## Contact

If you found any bug or have any suggestion to improve the ROLMIP project, don't hesitate to contact me! Cristiano Marcos Agulhari, email: agulhari AT utfpr DOT edu DOT br

## Citations

The current version of ROLMIP is free of charge and openly distributed, but if you used ROLMIP (and consequently YALMIP) on your programs, please don't forget to cite us!

Citation for [YALMIP](http://users.isy.liu.se/johanl/yalmip/pmwiki.php?n=Main.License)

### Citation for ROLMIP (New journal reference):

C. M. Agulhari, A. Felipe, R. C. L. F. Oliveira, and P. L. D. Peres. Algorithm 998: The Robust LMI Parser — A Toolbox to Construct LMI Conditions for Uncertain Systems. ACM Transactions on Mathematical Software, 45(3): 36:1-36:25, August 2019. 

### DOI:

http://doi.acm.org/10.1145/3323925

### Bibtex version:

@article{AFOP:19,<br>
author = {C. M. Agulhari and A. Felipe and R. C. L. F. Oliveira and P. L. D. Peres},<br>
title = {Algorithm 998: {T}he {R}obust {LMI} {P}arser --- {A} toolbox to construct {LMI} conditions for uncertain systems},<br>
journal = {ACM Transactions on Mathematical Software},<br>
volume = {45},<br>
number = {3},<br>
pages = {36:1--36:25},<br>
year  = {2019},<br>
month = {August},<br>
}

## Links

[SeDuMi](http://sedumi.ie.lehigh.edu/)
<br>
[Mosek](https://www.mosek.com/)
<br>
[R-RoMulOC - Randomized and Robust Multi-Objective Control toolbox](http://homepages.laas.fr/peaucell/software.php#romuloc)
<br>
[SOSTools](http://www.cds.caltech.edu/sostools/)

## Who used Rolmip

Click [here](https://scholar.google.com.br/scholar?cites=4276252120509952426&as_sdt=2005&sciodt=0,5&hl=pt-BR) to see who already used Rolmip.

<a href="https://clustrmaps.com/site/1bkzr" title="Visit tracker"><img src="//www.clustrmaps.com/map_v2.png?d=cZZMBeAZi_jHLLIZNjhvIkFwaRtVkR5eyBS7zqv_V1g&cl=ffffff"></a>

## Acknowledgments

This work is supported by the Brazilian agency CNPq grant 402830/2016-4.
