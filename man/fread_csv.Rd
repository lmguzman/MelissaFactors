% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fread.R
\name{fread_csv}
\alias{fread_csv}
\title{Reads CSV files checking for factors}
\usage{
fread_csv(file, check.factor = TRUE, ...)
}
\arguments{
\item{file}{File to be uploaded}

\item{check.factor}{If check.factor = TRUE, then the function will check for the length of factor levels.}

\item{...}{Name-value pairs of summary functions like read.csv()}
}
\value{
A data frame containing a representation of the data in the file
}
\description{
Wrapped around base read.csv, fread_csv checks the number of levels of a factor when reading csv files.
If the lenght of the levels is the same as the length of the variable, it will convert the variable to
a character type. Otherwise it will leave it as a factor.
}
\examples{
test1 <- factor(letters[1:10])
tf <- tempfile()
write.csv(test1, tf)

charreading <- fread_csv(tf, check.factor = TRUE)
str(charreading)

facreading <- fread_csv(tf, check.factor = FALSE)
str(facreading)
}

