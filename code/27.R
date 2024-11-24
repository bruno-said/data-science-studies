library( ggplot2 )

x <- c( 0, 4, 8, 12, 16, 20, 24 )
y <- c( 36, 47, 63, 78, 105, 130, 173 )

df <- data.frame( x, y )

modelo <- nls(
  formula = y ~ a * b ^ x,
  data = df,
  start = list( a = 1, b = 1 )
)

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
  xlab( 'Tempo (horas)' ) + 
  ylab( 'Contagem de Bactérias (CFU/mL)' ) +
  geom_text( 
    aes( x = min( x ), y = max( y ), label = texto), 
    hjust = 0, 
    vjust = 1 
  )
