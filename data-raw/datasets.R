## code to prepare datasets

accel = readRDS("accel.rds")
usethis::use_data(accel, overwrite = TRUE)

studies = readRDS("studies.rds")
usethis::use_data(studies, overwrite = TRUE)

conditions = readRDS("conditions.rds")
usethis::use_data(conditions, overwrite = TRUE)

countries = readRDS("countries.rds")
usethis::use_data(countries, overwrite = TRUE)

endpoints = readRDS("endpoints.rds")
usethis::use_data(endpoints, overwrite = TRUE)

risk = readRDS("risk.rds")
usethis::use_data(risk, overwrite = TRUE)

ca.svi = readRDS("ca.svi.rds")
usethis::use_data(ca.svi, overwrite = TRUE)
