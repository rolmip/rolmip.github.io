## Robust LMI Parser

The last version of ROLMIP can be downloaded [here](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser.zip).



## About the Software

ROLMIP (Robust LMI Parser) is a set of programs that works along with the [YALMIP](https://yalmip.github.io) toolbox, and it is designed to work specifically with optimization problems presenting parameter-dependent variables with parameters in the unit simplex. The variables are assumed to depend polynomially on the parameters, being the polynomials considered to be homogeneous. Such optimization problems arise, for example, on the analysis and synthesis conditions related to uncertain continuous or discrete systems, with constraints that are usually defined as Linear Matrix Inequalities (LMIs).

The main objective of ROLMIP is to provide an easy interface for the user, starting from the definition of the variables and going through a straighforward way in defining the LMIs. In addition, once all the variables and LMIs are set they can be converted into a Matlab executable file which solves the same problem but consuming much less time.

The details of ROLMIP can be found in the [User Manual](https://github.com/rolmip/rolmip.github.io/raw/master/manual_rolmip.zip).

## Download - New Version!

Download ROLMIP 3.0 [here](https://github.com/rolmip/rolmip.github.io/raw/master/robust_lmi_parser.zip) !

## Installation

To install ROLMIP in your computer, it suffices to unzip the file "robust_lmi_parser.zip" on a separate folder, and then add this folder on MATLAB's path.

## Versions history

Version 1.0: First release.

Version 1.1: Insertion of the syntax to choose, in the polynomial structure definition, to which monomial each matrix is related.

Version 2.0: Implementation of the multi-simplex structure; Insertion of the procedure affine2poly.m, to convert an affinely parameter-dependent polynomial into the multi-simplex structure.

Version 2.1: Easier definitions for constant matrices using poly_struct; Adaptation of the LMI definitions to the newest YALMIP version (thanks to Hugo Tadashi); Bug corrections.

Version 2.2: Bug corrections.

Version 2.3: Bug corrections.

Version 3.0: Insertion of the rolmipvar variable, which brings new functionalities; Bug corrections.

## Contact

If you found any bug or have any suggestion to improve the ROLMIP project, don't hesitate to contact me! Cristiano Marcos Agulhari, email: agulhari AT dt DOT fee DOT unicamp DOT br

## Citations

The current version of ROLMIP is free of charge and openly distributed, but if you used ROLMIP (and consequently YALMIP) on your programs, please don't forget to cite us!

Citation for [YALMIP](http://users.isy.liu.se/johanl/yalmip/pmwiki.php?n=Main.License)

### Citation for ROLMIP:

C. M. Agulhari, R. C. L. F. Oliveira, and P. L. D. Peres. Robust LMI parser: A computational
package to construct LMI conditions for uncertain systems. In Proceedings of the XIX Brazilian 
Conference on Automation (CBA 2012), pages 2298-2305, Campina Grande, PB, Brasil, September 2012.

### Bibtex version:

@INPROCEEDINGS{AOP:12c,

author = {C. M. Agulhari and R. C. L. F. de Oliveira and P. L. D. Peres},

title = {Robust {LMI} {P}arser: a computational package to construct {LMI} conditions for uncertain systems},

booktitle = {XIX Brazilian Conference on Automation (CBA 2012)},

year = {2012},

pages = {2298--2305},

month = {September},

address = {Campina Grande, PB, Brazil},

}

## Links

[SeDuMi](http://sedumi.ie.lehigh.edu/)

[Mosek](https://www.mosek.com/)

[R-RoMulOC - Randomized and Robust Multi-Objective Control toolbox](http://homepages.laas.fr/peaucell/software.php#romuloc)

[SOSTools](http://www.cds.caltech.edu/sostools/)

## Who used Rolmip

Click [here](https://scholar.google.com.br/scholar?cites=4276252120509952426&as_sdt=2005&sciodt=0,5&hl=pt-BR) to see who already used Rolmip.
