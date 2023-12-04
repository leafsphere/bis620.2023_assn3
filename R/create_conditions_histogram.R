#' @title Plots histogram of conditions examined in the studies
#' @description
#' Displays a histogram to show the distribution of conditions examined in the
#' studies in a query
#' @param d the dataframe of the query result
#' @param conditions the handle referencing the "conditions" database table
#' @return ggplot object that shows histogram of the examined conditions distribution
#' @importFrom dplyr select left_join mutate group_by summarize arrange
#' @importFrom forcats fct_lump_n
#' @importFrom ggplot2 ggplot geom_col scale_y_log10 labs theme_bw theme
#' @export
create_conditions_histogram = function(d, conditions) {
  em = d |>
    select(nct_id) |>
    left_join(conditions |> collect(), by = "nct_id")
  
  # lump together conditions that aren't considered the top 15 most frequent
  em <- em |>
    mutate(name = fct_lump_n(name, 15)) |>
    group_by(name) |>
    summarize(n = n()) |>
    arrange(desc(n)) |>
    mutate(conditionsordered = factor(name, levels = name))
  # multiply counts by 10 and divide them by 10 when scaling to make counts of 1 visible
  ggplot(em, aes(x = conditionsordered, y = n * 10)) +
    geom_col() +
    scale_y_log10(labels = function(x) x/10) +
    labs(x = "Condition Name", y = "Count") +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
}