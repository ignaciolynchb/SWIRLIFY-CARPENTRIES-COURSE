# prender el log
swirl_options(swirl_logging = TRUE)

gatos <- data.frame(color = c("mixto", "negro", "atigrado"),
                    peso = c(2.1, 5.0, 3.2),
                    le_gusta_cuerda = c(1, 0, 1))
# Path to data
datapath <- file.path(path.package('swirl'), 'Courses',
                       'SWIRLIFY-CARPENTRIES-COURSE', 'Explorando_data_frames','gapminder-FiveYearData.csv')