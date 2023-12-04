#' @title Outputs the most countries involved in studies in descending order
#' @description
#' Displays a table of countries in decreasing order of involvement (weren't
#' identified as having been removed) from the studies in a query
#' @param d the dataframe of the query result
#' @param countries the handle referencing the "countries" database table
#' @return dataframe object that lists the countries involved in the studies
#' in descending order of involvement
#' @importFrom dplyr collect select left_join filter group_by summarize arrange rename
#' @export
create_topcountries_table = function(d, countries) {
  countries <- countries |> collect()
  countries$name[is.na(countries$name)] = "Unknown"  # to avoid an empty row value
  
  d |>
    select(nct_id) |>
    left_join(countries |> collect(), by="nct_id") |>
    filter(removed == FALSE) |>
    group_by(name) |>
    summarize(Count = n()) |>
    arrange(desc(Count), name) |>
    rename(Country = name)
}