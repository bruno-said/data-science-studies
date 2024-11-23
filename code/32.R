library( ggplot2 )

data <- data.frame(
  x = c( 0, 2, 4, 6, 8, 10, 12, 14, 16 ),
  y = c( 8.24, 8.44, 8.95, 10.40, 11.26, 11.54, 11.88, 12.52, 12.90 )
)

modelo <- lm( data$y ~ data$x )
coeficientes <- modelo$coefficients
texto <- sprintf( 'y = %.2f + %.2fx, r² = %.2f', coeficientes[ 1 ], 
                  coeficientes[ 2 ], summary( modelo )$r.squared )

ggplot( data, aes( x, y )) + 
  geom_point() +
  #geom_abline( intercept = 14.52, slope = -1.05 * 10^(-4), color = 'red') +
  geom_smooth( method = 'lm', se = FALSE ) +
  xlab( 'Anos a partir de 2000' ) +
  ylab( 'Centavos/kWh' ) +
  geom_text( aes( x = min( data$x ), y = max( data$y ), label = texto)
             , hjust = 0, vjust = 1 )
