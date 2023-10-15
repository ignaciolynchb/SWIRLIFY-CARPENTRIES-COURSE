#A modo de ejemplo aquí hay un bucle while que genera números aleatorios a partir de una distribución uniforme (la función runif() ) entre 0 y 1 hasta que obtiene uno que es menor a 0.1.

z <- 1
while(z > 0.1){
  z <- runif(1)
  print(z)
}
