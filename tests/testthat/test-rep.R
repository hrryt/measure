test_that("rep works", {
  x <- measure(1:5, "m")
  expect_equal(rep(x, 2), measure(c(1:5, 1:5), "m"))
  expect_equal(rep(x, each = 2), measure(rep(1:5, each =  2), "m"))
})
test_that("rep.int works", {
  x <- measure(1:5, "m")
  expect_equal(rep.int(x, 2), measure(c(1:5, 1:5), "m"))
  expect_error(rep.int(x, each = 2), "unused argument")
})
test_that("rep_len works", {
  x <- measure(1:5, "m")
  expect_equal(rep_len(x, 8), measure(c(1:5, 1:3), "m"))
})
