# SWIRLIFY-CARPENTRIES-COURSE
Curso de R en español, basado en los contenidos de [Carpentries]([https://github.com/swirldev/swirl_courses/tree/master/R_Programming_Alt) sobre fundamentos de la programación en R. 

**Curso realizado por Mauricio Garcia e Ignacio Lynch, docentes del curso de Estadística Descriptiva de la Licenciatura en Estadística de FCEA-UDELAR, unidad curricular en la que se espera aplicar este curso a la brevedad.**

**Descripción**

El paquete [SWIRL] (http://swirlstats.com/)("Learn R, in R") permite crear cursos interactivos que se ejecutan desde la propia consola de R. Tienen la ventaja de que el estudiante puede ejecutar la instrucciones directamente en R en la medida que avanza su curso. 

El curso se organiza en lecciones ordenadas, aunque el estudiante podrá seleccionar las lecciones que sean de su interés.

**Objetivo**

El objetivo de este proyecto es disponer un curso interactivo sobre los fundamentos de la programación en R en idioma español.

**¿Como utilizar el curso?**

Para acceder a este curso debes tener instalado [R](https://cran.rstudio.com/) y [Rstudio](https://www.rstudio.com/products/rstudio/download/), así como el paquete [swirl](http://swirlstats.com/). Puedes instalarlo desde la consola de R con el siguiente código:

```{r}
install.packages('swirl')
```

Luego, debes instalar el curso:

```{r}
library(swirl)
install_course_github('ignaciolynchb','SWIRLIFY-CARPENTRIES-COURSE')
```

Los pasos anteriores se realizan una unica vez.

Para comenzar a utilizar el curso:

```{r}
library(swirl)
select_language(language = "spanish")
swirl()
```

Se nos solicitará que nos identifiquemos con un nombre a efectos de almacenar nuestro progreso. Luego seleccionamos el curso _SWIRLIFY-CARPENTRIES-COURSE_ y las lecciones que sean de nuestro interés.

_El curso se encuentra en construcción, por lo que proximamente se incorporarán más lecciones asi como algunas mejoras para registrar el progreso d el estudiante._
