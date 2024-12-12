import matplotlib as mpl
import matplotlib.pyplot as plt

def f ( x ):
  return ( x ** 2 - 3 * x ) / ( x ** 2 - 9 )

x = [ -2.5, -2.9, -2.95, -2.99, -2.999, -2.9999, -3.0001, -3.001, -3.01, -3.05, -3.1, -3.5 ]
y = []

for i in range( len( x ) ):
  y.append( f ( x[ i ] ) )

print( 'x      | y = f(x)' )
print( '-----------------' )

for i in range( len( x ) ):
  print( '{:.4f} | {:.6f}'.format( x[ i ], y[ i ] ) )

mpl.rcParams.update({
  'font.family': 'Times New Roman',
  'font.size': 10
})

plt.scatter( x, y )
plt.title( 'Verificando o limite de f(x) quando x tende a 3' )
plt.ylabel( 'f(x)' )
plt.xlabel( 'x' )
plt.grid()
plt.show()