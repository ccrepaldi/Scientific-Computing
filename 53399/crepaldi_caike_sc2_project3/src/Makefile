#!/bin/bash/

vfsim: vfs.o lorentz.o verlet.o main.o
	gfortran -o vfsim vfs.o lorentz.o verlet.o main.o

vfs.o: vfs.f90
	gfortran -c -O2 vfs.f90

lorentz.o: lorentz.f90
	gfortran -c -O2 lorentz.f90

verlet.o: verlet.f90
	gfortran -c -O2 verlet.f90

main.o: main.f90
	gfortran -c -O2 main.f90

clean:
	rm -f *.o *.mod
