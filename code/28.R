library( ggplot2 )

x <- c( 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110 )
y <- c( 76, 92, 106, 123, 131, 150, 179, 203, 227, 250, 281, 310 )

df <- data.frame( x, y )

modelo <- nls(
  formula = y ~ a * ( b ^ x ),
  data = df,
  start = list( a = 1, b = 1 )
)

summary( modelo )

a <- summary( modelo )$coefficients[ 1 ]
b <- summary( modelo )$coefficients[ 2 ]

texto <- sprintf( 'y = %.3f * %.3f ^ x', a, b )

ggplot(df, aes( x, y )) +
  geom_point() +
  geom_smooth( 
    method = 'nls', 
    formula = y ~ a * b ^ x, 
    method.args = list( start = c( a = 1, b = 1 ) ), 
    se = FALSE
  ) + 
  xlab( 'Ano' ) + 
  ylab( 'População' ) +
  geom_text( 
    aes( x = min( x ), y = max( y ), label = texto), 
    hjust = 0, 
    vjust = 1 
  )
