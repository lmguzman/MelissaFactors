context("factors as is")

test_that("fac_as_is creates a factor where levels are left as is", {
  x <- c('a', 'b')
  x_fact <- factor(x)
  y <- c('b', 'a')
  y_fact <- fac_as_is(y)

  expect_identical(levels(x_fact), c('a','b'))
  expect_that(any(y_fact == c('a','b')), is_false())
  expect_identical(levels(y_fact), c('b','a'))
})

