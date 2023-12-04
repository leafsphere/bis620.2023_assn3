#' @title Query keywords from a database table.
#' @description
#' Searches through a column of the database table using the
#' given keywords, with options to ignore letter case and matching on all or any 
#' of the keywords
#' @param tbl the database table
#' @param kwds the keywords to look for
#' @param column the column to look for the keywords in
#' @param ignore_case should the case be ignored when searching for a keyword?
#' (default TRUE)
#' @param match_all should we look for values that match all the keywords
#' (intersection) or any of the keywords (union) (default FALSE; union)
#' @return the subset of rows of the database table that match the search parameters
#' @importFrom dplyr filter sql
#' @importFrom stringr str_detect 
#' @export
query_kwds <- function(tbl, kwds, column, ignore_case = TRUE, match_all = FALSE) {
  if (!match_all) {
    tbl |>
      filter(grepl(paste0(kwds, collapse = "|"), !!as.symbol(column), ignore.case = ignore_case))
  }
}
