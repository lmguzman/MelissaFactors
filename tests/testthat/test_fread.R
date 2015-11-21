context("Read csv with factor checking")

test_that("reads a csv that checks that factors are suposed to be factors and not characters", {
  x<-data.frame(let = letters[1:12], name = c('Bob', 'Jul', 'Ane'))

  tf <- tempfile()
  write.csv(x, tf)

  charreading <- fread_csv(tf, check.factor = TRUE)
  facreading <- fread_csv(tf, check.factor = FALSE)

  expect_that(is.character(charreading$let), is_true())
  expect_that(is.character(facreading$let), is_false())
  expect_that(is.factor(charreading$name), is_true())
})
