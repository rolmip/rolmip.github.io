---
icon: lucide/check
title: Getting started
---

<h2>
  Easy to install in MATLAB
</h2>

ROLMIP handles the polynomial structure.  
[YALMIP](https://yalmip.github.io) models the optimization problem.  
An SDP solver computes the solution.

[:lucide-download: Download ROLMIP 3.3](https://github.com/rolmip/rolmip/archive/refs/tags/3.3.zip){ .md-button .md-button--primary }

---

## 1. Install the dependencies

Install [YALMIP](https://yalmip.github.io/download/).
To solve the stability and norm-bound examples,
also install [SeDuMi](https://github.com/sqlp/sedumi) and add both to your MATLAB path.

---

## 2. Add ROLMIP to your path

Extract the release and point MATLAB to its `rolmip` folder.
Replace the path below with your installation directory.

```matlab
addpath('</your/path>/rolmip-3.3/rolmip');
savepath;
```

---

## 3. Test your installation

Run the installation test and check that everything is working properly

```matlab
rolmiptest
```

---

## 4. Run your first example

Check the examples section and run it in MATLAB. Then explore the manual for multiple simplices, parameter-dependent variables and LMI export.

[:lucide-file-text: Read the user manual](https://github.com/rolmip/rolmip/blob/main/docs/manual_rolmip.pdf){ .md-button }
