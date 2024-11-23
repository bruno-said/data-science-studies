library( ggplot2 )

data <- data.frame(
  x = c( 50, 400, 500, 900, 1100, 10600, 10800, 20000, 30000 ),
  y = c( 2, 6, 5, 10, 26, 42, 37, 38, 50 )
)

modelo <- lm( data$y ~ data$x )
coeficientes <- modelo$coefficients
texto <- sprintf( 'y = %.2f + %.6fx, r² = %.2f', coeficientes[ 1 ], 
                  coeficientes[ 2 ], summary( modelo )$r.squared )

ggplot( data, aes( x, y )) + 
  geom_point() +
  #geom_abline( intercept = 14.52, slope = -1.05 * 10^(-4), color = 'red') +
  geom_smooth( method = 'lm', se = FALSE ) +
  xlab( 'Exposição (fibras/mL)' ) +
  ylab( 'Porcentagem dos ratos que desenvolveram tumores de pulmão' ) +
  geom_text( aes( x = min( data$x ), y = max( data$y ), label = texto)
             , hjust = 0, vjust = 1 )
