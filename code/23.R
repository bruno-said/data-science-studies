library( ggplot2 )

data <- data.frame(
  x = c( 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110 ),
  y = c( 48.3, 51.1, 55.2, 57.4, 62.5, 65.6, 66.6, 67.1, 70.0, 71.8, 73.0, 76.2 )
)

modelo <- lm( data$y ~ data$x )
coeficientes <- modelo$coefficients
texto <- sprintf( 'y = %.2f + %.6fx, r² = %.2f', coeficientes[ 1 ], 
                  coeficientes[ 2 ], summary( modelo )$r.squared )

ggplot( data, aes( x, y )) + 
  geom_point() +
  geom_abline( intercept = 14.52, slope = -1.05 * 10^(-4), color = 'red') +
  geom_smooth( method = 'lm', se = FALSE ) +
  xlab( 'Ano de nascimento' ) +
  ylab( 'Expectativa de vida' ) +
  geom_text( aes( x = min( data$x ), y = max( data$y ), label = texto)
             , hjust = 0, vjust = 1 )
