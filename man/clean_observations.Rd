% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_observations.R
\name{clean_observations}
\alias{clean_observations}
\title{Clean observations}
\usage{
clean_observations(data, id, var, max_na)
}
\arguments{
\item{data}{A data frame, or data frame extension (e.g. a tibble).}

\item{id}{The bare (unquoted) name of the column that identifies each
subject.}

\item{var}{The bare (unquoted) name of the column to be cleaned.}

\item{max_na}{An integer indicating the maximum number of \code{NA}s per
subject.}
}
\value{
The original \code{data} with the \code{var} observations matching
the \code{max_na} criterion replaced by \code{NA}.
}
\description{
Replace valid observations by \code{NA}s when a given subject has more then
\code{max_na} missing values.
}
\examples{
set.seed(10)

data <- data.frame(
  id = rep(1:5, each = 4),
  time = rep(1:4, 5),
  score = sample(c(1:5, rep(NA, 2)), 20, replace = TRUE)
)

clean_observations(data, id, score, 1)
}
