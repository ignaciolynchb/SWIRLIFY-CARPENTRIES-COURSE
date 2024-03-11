# prender el log
swirl_options(swirl_logging = TRUE)

gatos <- data.frame(color = c("mixto", "negro", "atigrado"),
                    peso = c(2.1, 5.0, 3.2),
                    le_gusta_cuerda = c(1, 0, 1))
# Path to data
datapath <- file.path(path.package('swirl'), 'Courses',
                       'SWIRLIFY CARPENTRIES COURSE', '03.Explorando_data_frames','gapminder-FiveYearData.csv')
library(googlesheets4)

# Set authentication token to be stored in a folder called `.secrets`
options(gargle_oauth_cache = ".secrets")

# Authenticate manually
gs4_auth()

# If successful, the previous step stores a token file.
# Check that a file has been created with:
list.files(".secrets/")

# Check that the non-interactive authentication works by first deauthorizing:
gs4_deauth()

