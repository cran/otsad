% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{cpu_utilization_asg_misconfiguration}
\alias{cpu_utilization_asg_misconfiguration}
\title{cpu_utilization_asg_misconfiguration.}
\format{A data frame with three variables: \code{timestamp}, \code{value},
  \code{is.real.anomaly}.

For further details, see \url{https://github.com/numenta/NAB/blob/master/data/README.md}}
\usage{
cpu_utilization_asg_misconfiguration
}
\description{
From Amazon Web Services (AWS) monitoring CPU usage – i.e. average CPU usage across a
given cluster. When usage is high, AWS spins up a new machine, and uses fewer
machines when usage is low.
}
\keyword{datasets}
