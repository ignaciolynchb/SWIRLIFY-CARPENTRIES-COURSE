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

**Soy responsable de un curso y quiero utilizar SWIRLIFY-CARPENTRIES-COURSE con mis estudiantes. ¿Cómo monitorear el progreso de mis estudiantes en el curso?**

Al comenzar con SWIRL, se solicitará que el estudiante se identifique. Solicita a tus estudiantes que completen alli un nombre con el que puedas identificarlos!

Al completar cada lección, el estudiante tendrá la opcion de enviar automaticamente su progreso a través de un Google Form, el cual se abrirá automaticamente y en el cual deberá responder la pregunta "¿Cual es tu curso?" con un nombre de curso proporcionado por ti. 

Podrás visualizar los resultados de todos los estudiantes que hayan completado lecciones bajo el nombre de curso proporcionado por ti. 

Para ello, debes utilizar dos archivos:
- "Parametros para informe de progreso.txt": debes completar con los datos de tu interés.
  1. mi_curso="nombre_mi_curso" #Nombre de tu curso, con el cual tus estudiantes enviaron su progreso
  2. fecha_desde="AAAA-MM-DD" #Fecha desde la cual quieres considerar el progreso de tus estudiantes
  3. fecha_hasta="AAAA-MM-DD" #Fecha hasta la cual quieres considerar el progreso de tus estudiantes
- "Informe de progreso.rmd": exporta el informe en formato html con Knit
