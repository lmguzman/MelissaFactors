#' Reads CSV files checking for factors
#'
#' Wrapped around base read.csv, fread_csv checks the number of levels of a factor when reading csv files.
#' If the lenght of the levels is the name as the length of the variable, it will convert the variable to
#' a character type. Otherwise it will leave it as a factor.
#'
#' @param file File to be uploaded
#' @param check.factor If check.factor = TRUE, then the function will check for the length of factor levels.
#'
#' @return A data frame containing a representation of the data in the file
#' @export
#'
#' @examples
#' test1 <- factor(letters[1:10])
#' tf <- tempfile()
#' write.csv(test1, tf)
#'
#' charreading <- fread_csv(tf, check.factor = TRUE)
#' str(charreading)
#'
#' facreading <- fread_csv(tf, check.factor = FALSE)
#' str(facreading)
#'
fread_csv<-function(file, check.factor = TRUE, ...){
  if(check.factor == TRUE){
    DATA <- read.csv(file, ...)
    fvec <- DATA[,which(sapply(DATA, class) == 'factor'), drop = FALSE]
    flevels <- sapply(fvec, nlevels)
    flength <- sapply(fvec, length)
    ColumNames <- names(which(flevels == flength))
    DATA[ColumNames] <- sapply(DATA[ColumNames], as.character)
  }
    else{
      DATA <- read.csv(file, ...)
    }
  return(DATA)
}
