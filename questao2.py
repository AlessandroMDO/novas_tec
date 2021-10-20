import sympy as sp

theta1, d1, d2, d3 = sp.symbols("theta_1 d_1 d_2 d_3")

## Definindo geometria
H1 = 1
H2 = 0.7
H3 = 0.6
D1 = 0.40
D2 = 0.50

## Matriz de Transformação 
T = sp.Matrix([[sp.cos(theta1),0,-sp.sin(theta1), -sp.sin(theta1)*d3],
               [sp.sin(theta1),0,sp.cos(theta1),sp.cos(theta1)*d3],
               [0,-1,0,d1+d2],
               [0,0,0,1]])
#print(sp.latex(Ts))


## Sistema u = Tv
pos_base = sp.Matrix([0, 0, 0, 1])
pos_deposito = sp.Matrix([0, D2 , H2, 1])
pos_furador = sp.Matrix([0, -1*D1 , H1, 1])

home2deposito = T*pos_base - pos_deposito  
deposito2furador = T*pos_base- pos_furador

path1 = sp.solve(home2deposito.subs({d1:H3}))
path2 = sp.solve(deposito2furador.subs({d1:H3}))

print(path1)
print(path2)
