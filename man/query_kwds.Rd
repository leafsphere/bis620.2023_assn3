% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query_keywords.R
\name{query_kwds}
\alias{query_kwds}
\title{Query keywords from a database table.}
\usage{
query_kwds(tbl, kwds, column, ignore_case = TRUE, match_all = FALSE)
}
\arguments{
\item{tbl}{the database table}

\item{kwds}{the keywords to look for}

\item{column}{the column to look for the keywords in}

\item{ignore_case}{should the case be ignored when searching for a keyword?
(default TRUE)}

\item{match_all}{should we look for values that match all the keywords
(intersection) or any of the keywords (union) (default FALSE; union)}
}
\value{
the subset of rows of the database table that match the search parameters
}
\description{
Searches through a column of the database table using the
given keywords, with options to ignore letter case and matching on all or any
of the keywords
}
