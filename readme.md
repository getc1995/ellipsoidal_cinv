# Ellipsoidal Controlled Invariant Set

This repo is an implementation of calculating controlled invariant set using ellipsoidal approximation.

If you just want to calculate ellipsoidal controlled invariant set,  then no additional toolbox needs to be installed, since the algorithm only uses matrix operations that standard MATLAB supports.

Folder `altmany-export_fig` is forked from <https://github.com/altmany/export_fig> for saving nice figures.

To run the model predictive control optimizer with ellipsoidal constraints, you need to install `ecos-matlab` from https://github.com/embotech/ecos-matlab, which is an optimizer customized for SOCP programs. Then add `ecos/ecosqcqp.m` to the path. 

To run the code for polytopic controlled invariant set for comparison, see https://github.com/pettni/pcis

