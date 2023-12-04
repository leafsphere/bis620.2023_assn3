#' @title Plots histogram of study types of the studies
#' @description
#' Displays a histogram to show the distribution of study types of the
#' studies in a query
#' @param d the dataframe of the query result
#' @return ggplot object that shows histogram of the study type distribution
#' @importFrom dplyr select mutate if_else group_by summarize
#' @importFrom ggplot2 ggplot geom_col scale_y_log10 theme_bw xlab ylab
#' @export
create_study_type_histogram = function(d) {
  d$study_type[is.na(d$study_type)] = "NA" 
  
  d <- d |>
    select(study_type) |>
    # group observational studies together
    mutate(study_type = if_else(study_type == "Observational [Patient Registry]",
                                "Observational", study_type)) |>
    group_by(study_type) |>
    summarize(n = n())
  # multiply counts by 10 and divide them by 10 when scaling to make counts of 1 visible
  ggplot(d, aes(x = study_type, y = n * 10)) +
    geom_col() +
    scale_y_log10(labels = function(x) x/10) +
    theme_bw() +
    xlab("Study Type") +
    ylab("Count")
}