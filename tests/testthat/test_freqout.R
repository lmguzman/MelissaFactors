context("Count factor categories")

test_that("freq_out counts all the categories and tallys them up", {
  x <- factor(rep(c('Andy','Mark'), 20))
  x_count <- freq_out(x)

  expect_that(is.factor(x_count$x), is_true())
  expect_that(length(x_count) == length(levels(x)), is_true())
  expect_that(length(x) == sum(x_count$n), is_true())
  expect_that(length(x) == length(x_count), is_false())
})
