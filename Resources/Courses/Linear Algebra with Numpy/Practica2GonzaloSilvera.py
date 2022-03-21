#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Algebra lineal con Numpy
# Práctico 2
# Gonzalo Silvera

# 1) Implemente una función que reciba una matriz como parámetro e indique por
# pantalla si la matriz es:
# • Matriz cuadrada
# • Matriz simétrica
# • Matriz triangular
# • Matriz diagonal
# • Matriz de identidad
# • Matriz ortogonal

from numpy import array
from numpy import tril
from numpy import triu
from numpy import diag
from numpy import identity
from numpy.linalg import inv 

def mtipo(m):
    if m.shape[0]==m.shape[0]:
        print("Matriz cuadrada")
    elif m.all()==m.T.all():
        print("Matriz simétrica")
    elif m.all()==tril(m).all() or m.all()==triu(m).all():
        print("Matriz triangular")
    elif m.all()==diag(diag(m)).all():
        print("Matriz diagonal")
    elif m.all()==identity(m.shape[0]).all():
        print("Matriz identidad")
    elif m.all()==m.dot(m.T).all():
        print("Matriz identidad")
    elif m.T.dot(m).all()==m.dot(m.T).all() and m.T.all()==inv(m) and m.dot(m.T):
        print("Matriz ortogonal")
    else:
        print("Matriz no cuadrada")

# 2) Implemente una función que reciba dos matrices como parámetro e indique por
# pantalla si:
# • Una es la Transpuesta de la otra
# • Una es la Inversa de la otra

from numpy import array
from numpy.linalg import inv 

def mti(m1,m2):
    if m1.all()==m2.T.all():
        print("Una es la Transpuesta de la otra")
    elif m1.all()==inv(m2).all():
        print("Una es la Inversa de la otra")
    else:
        print("No es Transpuesta o Inversa")
    
# 3) Implemente una función que calcule paso a paso el determinante de una matriz de
# 3x3 mediante su algoritmo preferido y compare su resultado con el resultado con la
# función det.

from numpy import array
from numpy.linalg import det

m3x3=array([
[1, 2, 3],
[4, 15, 6],
[78, 8, 9]])

m3x3det=det(m3x3)

print("Determinante con det()\n\n",m3x3det)

def mdeterminante(m):
    if len(m) == 3:
        a,b,c=m[0]
        efhi=m[1:,1:]
        dfgi=m[1:,0::2]
        degh=m[1:,:2]
        aefhi=a*(efhi[0,0]*efhi[1,1]-efhi[0,1]*efhi[1,0])
        bdfgi=b*(dfgi[0,0]*dfgi[1,1]-dfgi[0,1]*dfgi[1,0])
        cdegh=c*(degh[0,0]*degh[1,1]-degh[0,1]*degh[1,0])
        return aefhi-bdfgi+cdegh

print("\nDeterminante sin det()\n\n",mdeterminante(m3x3))
    
# 4) Cree una matriz de 5x5, obtenga su traza y muestre por pantalla tanto la matriz como
# la traza obtenida.

from numpy import array
from numpy import trace 

m5x5=array([
[1, 2, 3, 4, 5],
[1, 2, 3, 4, 5],
[1, 2, 3, 4, 5],
[1, 2, 3, 4, 5],
[1, 2, 3, 4, 5]])

print("Matriz\n\n", m5x5)
print("\nTraza\n\n", trace(m5x5))


# 5) Cree una matriz de ceros de 2x2 y obtenga su rango, muestre la matriz y el rango
# obtenido por pantalla.

from numpy import array
from numpy import zeros
from numpy.linalg import matrix_rank

mceros2x2=zeros([2,2])

print("Matriz\n\n", mceros2x2)
print("\nRango\n\n",  matrix_rank(mceros2x2))
