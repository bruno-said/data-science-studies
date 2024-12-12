import matplotlib as mpl
import matplotlib.pyplot as plt

def f ( x ):
  return ( ( 2 + x ) ** 5 - 32 ) / x

x = [ 0.5, 0.1, 0.01, 0.001, 0.0001, -0.0001, -0.001, -0.01, -0.1, -0.5 ]
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
plt.title( 'Verificando o limite de f(x) quando x tende a 0' )
plt.ylabel( 'f(x)' )
plt.xlabel( 'x' )
plt.grid()
plt.show()