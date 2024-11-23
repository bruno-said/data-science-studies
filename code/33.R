library( ggplot2 )

x <- c( 0.387, 0.723, 1, 1.523, 5.203, 9.541, 19.190, 30.086 )
y <- c( 0.241, 0.615, 1, 1.881,11.861, 29.457, 84.008, 164.784 )

df <- data.frame( x, y )

modelo <- nls(
  formula = y ~ a * x ^ b,
  data = df,
  start = list( a = 1, b = 1 )
)

a <- summary( modelo )$coefficients[ 1 ]
b <- summary( modelo )$coefficients[ 2 ]

texto <- sprintf( 'y = %.3f * x ^ %.3f', a, b )

ggplot(df, aes( x, y )) +
  geom_point() +
  geom_smooth( 
    method = 'nls', 
    formula = y ~ a * x ^ b, 
    method.args = list( start = c( a = 1, b = 1) ), 
    se = FALSE
  ) + 
  xlab( 'd (Terra-Sol)' ) + 
  ylab( 'T (anos)' ) +
  geom_text( 
    aes( x = min( x ), y = max( y ), label = texto), 
    hjust = 0, 
    vjust = 1 
  )
