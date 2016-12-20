#! /bin/bash
rm -rf ../solver
ifort -O3 -heap-arrays *.f90 -o ../solver
echo '***compile successfully -> solver*^_^'