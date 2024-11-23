library( ggplot2 )

data <- data.frame(
  rendimento = c( 4000, 6000, 8000, 12000, 16000, 20000, 30000, 45000, 60000 ),
  taxa_de_ulcera = c( 14.1, 13.0, 13.4, 12.5, 12.0, 12.4, 10.5, 9.4, 8.2 )
)

modelo <- lm( data$taxa_de_ulcera ~ data$rendimento )
coeficientes <- modelo$coefficients
texto <- sprintf( 'y = %.2f + %.6fx, r² = %.2f', coeficientes[ 1 ], 
                  coeficientes[ 2 ], summary( modelo )$r.squared )

ggplot( data, aes( rendimento, taxa_de_ulcera )) + 
  geom_point() +
  geom_abline( intercept = 14.52, slope = -1.05 * 10^(-4), color = 'red') +
  geom_smooth( method = 'lm', se = FALSE ) +
  xlab( 'Rendimento' ) +
  ylab( 'Taxa de Ùlcera (por população de 100)' ) +
  geom_text( aes( x = min( data$rendimento ), y = 10, label = texto)
             , hjust = 0, vjust = 1 )
  