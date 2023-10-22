library(swirlify)
library(tidyverse)
library(base64enc)
library(here)
library(googlesheets4)
library(xtable)
library(DT)
library(lubridate)

# decodificar un log
deco_fn <- possibly(function(zz, lim=nchar(zz), col_types = cols(
  user = col_character(), course_name = col_character(), lesson_name = col_character(),
  question_number = col_integer(), correct = col_logical(), attempt = col_integer(),
  skipped = col_logical(), datetime = col_double())) 
{
  if (!is.character(zz) ) 
    return(NA)
  
  temp <- tempfile()
  y <- suppressWarnings( base64decode( gsub("=", '',  zz) ) )
  y <- y[1:lim]
  ll <- rawToChar( y[y!='00']  )

  cat(ll, file = temp)

  read_csv(temp, col_types = col_types, locale = locale(encoding = "ISO-8859-1"))
}, 
otherwise=NA)

# leer los datos de google forms
registro_fn <- function() {
    registro <- read_sheet("https://docs.google.com/spreadsheets/d/1zQmOHV39VH2VahlGQm7HcDch36BbCN2OLMbhnvnieew/edit?usp=sharing")
    data.frame( 
    marca = registro[,1], 
    curso = unlist(registro[,2]),
    lg = unlist(registro[,4]),
    email = registro[,3],
    stringsAsFactors = FALSE
  )
}

# armamos hoja de datos con avance
my_decode <- function(encoded) { 
  ll <- suppressWarnings( lapply(encoded[,3], deco_fn, lim=500) )
  names(ll) <- encoded$lg
  nncols <-  lapply(ll, function(x) {
    nn <- ncol(x)
    if ( is.null(nn) ) nn <- 0
    return(nn)
  } )  %>% unlist()
  
  nnrows <-  lapply(ll, function(x) {
    nn <- nrow(x)
    if ( is.null(nn) ) nn <- 0
    return(nn)
  } )  %>% unlist()
  
  oo <- do.call(rbind, ll[nncols==8])
  oo$dir.correo <- rep(names(nnrows[nncols==8]), times=nnrows[nncols==8])
  return(oo)
}

encoD <- registro_fn()
row.names(encoD) <- NULL
dor <- my_decode( encoD )
tiempo <-  as_datetime(dor$datetime)

d <- dor
leccion <- d$lesson_name

progreso <-  d %>% 
  group_by(user) %>% 
  summarise(
    estudiante = first(user),
    dir.correo = first(dir.correo), 
    correctas = sum(correct, na.rm = TRUE), 
    intentos = mean(attempt, na.rm=TRUE), 
    saltea = sum(skipped, na.rm = TRUE)
  )