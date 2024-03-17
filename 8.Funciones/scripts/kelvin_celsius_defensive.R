#No es necesario que realices cambios en este script, simplemente analizalo con atención

kelvin_celsius_defensive <- function(kelvin) { 
    #Progreamación defensiva: el primer paso de la funcion es chequear que el output tenga el formato esperado (numerico)
    if (!is.numeric(kelvin)) {
      stop("kelvin debe ser numerico. Especifique un numero como input") #Si no es numerico, se devuelve este mensaje de error
    }
    celsius <- kelvin - 273.15
    return(celsius) #Si es numerico, retorna el resultado
}

#Ponemos a prueba nuestra función
kelvin_celsius_defensive("uno")

#Escribe submit() para continuar