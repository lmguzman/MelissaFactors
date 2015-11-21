#' Factors as is
#'
#' Wrapped around factor, factor as is assignes the levels of the factor in the order in which they appear in the data.
#'
#' @param x a vector of data
#'
#' @return a factor
#' @export
#'
#' @examples
#'
#' a <- c('sam', 'harry', 'andy')
#' f_as_is(a)
#' factor(a)
#'
f_as_is <- function(x, ...){
  level <- unique(x)
  x <- factor(x, levels = level, ...)
  assertthat::assert_that(is.factor(x))
  return(x)
}
