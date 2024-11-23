library( ggplot2 )

data <- data.frame(
  x = c( 50.1, 48.3, 45.2, 44.7, 44.5, 42.7, 39.5, 38.0 ),
  y = c( 178.5, 173.6, 164.8, 163.7, 168.3, 165.0, 155.4, 155.8)
)

modelo <- lm( data$y ~ data$x )
coeficientes <- modelo$coefficients
texto <- sprintf( 'y = %.2f + %.2fx, r² = %.2f', coeficientes[ 1 ], 
                  coeficientes[ 2 ], summary( modelo )$r.squared )

ggplot( data, aes( x, y )) + 
  geom_point() +
  #geom_abline( intercept = 14.52, slope = -1.05 * 10^(-4), color = 'red') +
  geom_smooth( method = 'lm', se = FALSE ) +
  xlab( 'Comprimento do fêmur (cm)' ) +
  ylab( 'Altura (cm)' ) +
  geom_text( aes( x = min( data$x ), y = max( data$y ), label = texto)
             , hjust = 0, vjust = 1 )
