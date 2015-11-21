<!-- README.md is generated from README.Rmd. Please edit that file -->
This is a factors package for [STAT 545](http://stat545-ubc.github.io).

Here's how to use the `Mfactors` package.

Mfactors is a package designed to make factors less painful. It consists of four main functions:

-   fbind
-   freq\_out
-   fac\_as\_is
-   fread\_csv

Installation
------------

``` r
#install.packages("devtools")
devtools::install_github("lmguzman/MelissaFactors")
library(Mfactors)
```

Usage
-----

### fbind

`fbind()` makes sure that the levels of the two factors are also binded together.

``` r
fbind(iris$Species[c(1, 51, 101)], PlantGrowth$group[c(1, 11, 21)])
#> [1] setosa     versicolor virginica  ctrl       trt1       trt2      
#> Levels: ctrl setosa trt1 trt2 versicolor virginica
```

### freq\_out

`freq_out()` Is the equivalent from dplyr for count. It tally's up the different categories on a factor.

``` r
freq_out(iris$Species)
#> Source: local data frame [3 x 2]
#> 
#>            x     n
#>       (fctr) (int)
#> 1     setosa    50
#> 2 versicolor    50
#> 3  virginica    50
```

### fac\_as\_is

`fac_as_is()` creates a factor, but it leaves the levels as they appear on the data and not in alphabetical order.

``` r
x <- c('candy', 'wont', 'make', 'me', 'sick')
```

check out the levels

``` r
levels(factor(x))
#> [1] "candy" "make"  "me"    "sick"  "wont"
levels(fac_as_is(x))
#> [1] "candy" "wont"  "make"  "me"    "sick"
```

### fread\_csv

`fread_csv()` reads a csv but checks all columns that are imported as factors. If the number of levels in the factor is equal to the length of the column, then it becomes a character type. Othewise is left as a factor. All of the arguments passed onto `read.csv()` are available on `fread_csv()` plus an extra argument to check the factor.

``` r
tenletters <- factor(letters[1:10])
tf <- tempfile()
write.csv(tenletters, tf)

character_reading <- fread_csv(tf, check.factor = TRUE)

factor_reading <- fread_csv(tf, check.factor = FALSE)
```

Compare the structure when check.factor is TRUE or FALSE

``` r
str(character_reading)
#> 'data.frame':    10 obs. of  2 variables:
#>  $ X: int  1 2 3 4 5 6 7 8 9 10
#>  $ x: chr [1:10, 1] "a" "b" "c" "d" ...
#>   ..- attr(*, "dimnames")=List of 2
#>   .. ..$ : NULL
#>   .. ..$ : chr "x"
str(factor_reading)
#> 'data.frame':    10 obs. of  2 variables:
#>  $ X: int  1 2 3 4 5 6 7 8 9 10
#>  $ x: Factor w/ 10 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10
```
