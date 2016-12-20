#! /bin/bash

ifort -O3 -heap-arrays ./src/solver/*.f90 -o ./solver
echo '***compile successfully -> solver*^_^'