library( ggplot2 )

x <- c( 10, 103, 8959, 11424, 79192, 114524 )
y <- c( 5, 9, 40, 39, 84, 76 )

df <- data.frame( x, y )

modelo <- nls(
  formula = y ~ a * x ^ b,
  data = df,
  start = list( a = 0.1, b = 0.1 )
)

a <- summary( modelo )$coefficients[ 1 ]
b <- summary( modelo )$coefficients[ 2 ]

texto <- sprintf( 'y = %.3f * x ^ %.3f', a, b )

ggplot(df, aes( x, y )) +
  geom_point() +
  geom_smooth( 
    method = 'nls', 
    formula = y ~ a * x ^ b, 
    method.args = list( start = c( a = 0.1, b = 0.1) ), 
    se = FALSE
  ) + 
  xlab( 'A (km²)' ) + 
  ylab( 'N' ) +
  geom_text( 
    aes( x = min( x ), y = max( y ), label = texto), 
    hjust = 0, 
    vjust = 1 
  )
