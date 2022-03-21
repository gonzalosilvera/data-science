# Guía Práctica Semanal 3: Lectures 9-12

# Nota: la práctica se deberá entregar mediante moodle, en un único archivo de código con el
# nombre PracticaXNombreApellido.py


# 1) implemente una función que reciba un valor de densidad (float) y el número de elementos
# de una matriz (valor entero) y calcule la cantidad de elementos no cero que debería tener la
# matriz para esa densidad (debe retornar un entero).

print("Ejercicio 1\n")

from numpy import array
from numpy import count_nonzero

A = array([
[1, 0, 0, 1, 0, 0],
[0, 0, 2, 0, 0, 1],
[0, 0, 0, 2, 0, 0]])

def ndif0(x):
    resultado=int(count_nonzero(x))
    return resultado

print("Matriz\n\n", A, "\n\nCantidad de elementos no cero\n\n", ndif0(A))

# 2) implemente una función que reciba por parámetro dos tensores A y B e imprima por
# pantalla:
# • el producto Hadamard entre ellos y sus dimensiones
# • el producto Tensor entre ellos y sus dimensiones

print("\nEjercicio 2\n")

from numpy import array
from numpy import tensordot

A = array([1,2])

B = array([3,4])

def tprod(m1,m2):
    ph=m1*m2
    pt=tensordot(m1, m2, axes=0)
    print("Producto Hadamard\n\n", ph, "\n\nProducto Tensor\n\n", pt)

tprod(A,B)

# 3) implemente una función que reciba por parámetro dos matrices A y B y verifique si B es
# la descomposición de Cholesky de A

print("\nEjercicio 3\n")

from numpy import array
from numpy.linalg import cholesky

A = array([ [2,
1, 1],
[1, 2, 1],
[1, 1, 2]])

B = cholesky(A)

def mchol(m1,m2):
    if cholesky(m1).all()==m2.all():
        print("La matriz\n\n", m2, "\n\nes la descomposición de Cholesky de la matriz\n\n", m1)
    else:
        print("La matriz\n\n", m2, "\n\no es la descomposición de Cholesky de la matriz\n\n", m1)

mchol(A,B)

# 4) implemente una función que reciba por parámetro una matriz y un vector y verifique si el
# vector es vector propio de la matriz.

print("\nEjercicio 4\n")

from numpy import array
from numpy.linalg import eig

A = array([[1,2, 3],[4, 5, 6],[7, 8, 9]])

values, vectors = eig(A)

B = vectors[0]

def vprop(m,v):
    values, vectors = eig(m)
    count=0
    for i in vectors:
        if i.all()==v.all():
            count+=1
        else:
            None
    if count>0:
        print("El vector\n\n", v, "\n\nes vector propio de la matriz\n\n", m)
    else:
        print("El vector\n\n", v, "\n\nno es vector propio de la matriz\n\n", m)

vprop(A,B)