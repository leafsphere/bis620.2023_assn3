#' Accelerometry Data Resampled from UK Biobank
#'
#' Toy accelerometry data for BIS620
#'
#' @format ## `accel`
#' A data frame with 1,080,000 rows and 4 columns:
#' \describe{
#'   \item{time}{the time of the measurement}
#'   \item{X, Y, Z}{Accelerometry measurement (in milligravities).}
#' }
"accel"


#' Conditions table from ctrialsgov duckdb with 2 columns dropped
#'
#' @format ## `conditions`
#' A data frame with 815,944 rows and 2 columns:
#' \describe{
#'   \item{nct_id}{Unique identifier assigned to each study on clinicaltrials.gov}
#'   \item{name}{Name of condition}
#' }
"conditions"


#' Countries table from ctrialsgov duckdb with 1 column dropped
#'
#' @format ## `countries`
#' A data frame with 653,881 rows and 3 columns:
#' \describe{
#'   \item{nct_id}{Unique identifier assigned to each study on clinicaltrials.gov}
#'   \item{name}{Name of country}
#'   \item{removed}{Whether country was removed or not from the study}
#' }
"countries"


#' Endpoints of studies from ctrialsgov duckdb
#'
#' @format ## `endpoints`
#' A data frame with 6,084 rows and 3 columns:
#' \describe{
#'   \item{nct_id}{Unique identifier assigned to each study on clinicaltrials.gov}
#'   \item{endpoint_met}{Whether endpoint was met or not}
#' }
"endpoints"


#' Subset of studies table from ctrialsgov duckdb
#'
#' @format ## `studies`
#' A data frame with 25,000 rows and 70 columns:
#' \describe{
#'   \item{nct_id}{Unique identifier assigned to each study on clinicaltrials.gov}
#'   \item{endpoint_met}{Whether endpoint was met or not}
#' }
"studies"
