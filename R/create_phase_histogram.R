#' @title Plots histogram of phases of the studies
#' @description
#' Displays a histogram to show the distribution of phases from the studies in a query
#' @param d the dataframe of the query result
#' @param studies the handle referencing the "studies" database table
#' @return ggplot object that shows histogram of trial phase distribution
#' @importFrom dplyr collect select group_by summarize
#' @importFrom tidyr complete
#' @importFrom ggplot2 ggplot geom_col theme_bw xlab ylab
#' @export
create_phase_histogram = function(d, studies) {
  d$phase[is.na(d$phase)] = "NA"
  
  # save all possible phases in a vector
  sorted_phases <- (studies |> collect())$phase |> 
    unique() |>
    append("NA") |>
    sort()
  
  d$newphase <- factor(d$phase, levels=sorted_phases)
  
  d <- d |>
    select(newphase) |>
    group_by(newphase) |>
    summarize(n = n()) |>
    complete(newphase)
  
  ggplot(d, aes(x = newphase, y = n)) +
    geom_col() +
    theme_bw() +
    xlab("Phase") +
    ylab("Count")
}