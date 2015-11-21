#' Factors as is
#'
#' Wrapped around factor, factor as is assignes the levels of the factor in the order in which they appear in the data.
#'
#' @param x a vector of data
#'
#' @param ... Name-value pairs of summary functions like factor()
#'
#' @return factor
#' @export
#' @examples
#' a <- c('sam', 'harry', 'andy')
#' fac_as_is(a)
#' factor(a)
fac_as_is <- function(x, ...){
  level <- unique(x)
  x <- factor(x, levels = level, ...)
  return(x)
}
