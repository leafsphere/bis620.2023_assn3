#' @title Plots histogram of endpoint status in the studies
#' @description
#' Displays a histogram to show the distribution of whether the endpoint was
#' met or not in the studies in a query
#' @param d the dataframe of the query result
#' @param endpoints the dataframe that contains endpoint information of the studies
#' @return ggplot object that shows histogram of the distribution of whether the
#' endpoint was met or not
#' @importFrom dplyr select left_join group_by summarize
#' @importFrom ggplot2 ggplot geom_col scale_y_log10 labs theme_bw
#' @export
create_endpoint_histogram = function(d, endpoints) {
  em = d |>
    select(nct_id) |>
    left_join(endpoints, by = "nct_id") |>
    group_by(endpoint_met) |>
    summarize(n = n())
  
  # multiply counts by 10 and divide them by 10 when scaling to make counts of 1 visible
  ggplot(em, aes(x = endpoint_met, y = n * 10)) +
    geom_col() +
    scale_y_log10(labels = function(x) x/10) +
    labs(x = "Endpoint Met", y = "Count") +
    theme_bw()
}
