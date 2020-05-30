# unit test for the forint function to make sure that forint(42) returns 42 HUF

context("currency of output")
library(scales)

test_that("HUF has been added", {
  expect_equal(forint(42), "42HUF")
})


test_that("HUF is of character class", {
  expect_equal(class(forint(42)), "character")
})
