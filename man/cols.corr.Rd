% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/cols_corr.R
\name{cols.corr}
\alias{cols.corr}
\title{Columns correlation to the dimensions chart}
\usage{
cols.corr(data, x)
}
\arguments{
\item{data:}{name of the dataset.}

\item{x:}{dimension for which the column categories correlation is returned.}
}
\description{
This function allows you to calculate the correlation of the column categories to the selected dimensions.
}
\examples{
data(greenacre_data)
cols.corr(greenacre_data, 1) #Returns the correlation of the column categories to the 1 CA dimension.
}
\keyword{cols}
\keyword{correlation}

