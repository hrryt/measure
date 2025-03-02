test_that("prod works", {
  x <- measure(1:6, "k|m^2 s^-1")
  y <- measure(2, "100 J mol^-1 K^-1")
  z <- measure(0.2, ".01 K J^-1 m^-1 s")
  expect_equal(prod(x, y, z), measure(288, "1000 k|m^11 s^-5 mol^-1"))
  expect_equal(prod(0, x), 0)
  expect_equal(prod(x, 0), measure(0))
})
test_that("range works", {
  w <- measure(3)
  x <- measure(1:5, "k|m^2 s^-1")
  y <- measure(6, "100 m^2 s^-1")
  z <- measure(1, "m s^-1")
  expect_equal(range(x, y), measure(c(6e-4, 5), "k|m^2 s^-1"))
  expect_equal(range(y, x), measure(c(6, 5e4), "100 m^2 s^-1"))
  expect_equal(range(w, 2), measure(2:3))
  expect_equal(range(2, x), c(1, 5))
  expect_equal(range(x), measure(c(1, 5), units(x)))
  expect_equal(range(x, 0), measure(c(0, 5), units(x)))
  expect_error(range(x, z), class = "measure_incomparable")
  expect_error(range(x, 2), class = "measure_incomparable")
})
test_that("sum works", {
  w <- measure(3)
  x <- measure(1:5, "k|m^2 s^-1")
  y <- measure(6, "100 m^2 s^-1")
  z <- measure(1, "m s^-1")
  expect_equal(sum(x, y), measure(15.0006, "k|m^2 s^-1"))
  expect_equal(sum(y, x), measure(150006, "100 m^2 s^-1"))
  expect_equal(sum(w, 2), measure(5))
  expect_equal(sum(2, x), 17)
  expect_equal(sum(x, 0), measure(15, units(x)))
  expect_equal(sum(x), measure(15, units(x)))
  expect_error(sum(x, z), class = "measure_incomparable")
  expect_error(sum(x, 2), class = "measure_incomparable")
})
test_that("sign works", {
  expect_equal(sign(measure(-2:2, "m")), measure(sign(-2:2)))
  expect_equal(sign(measure(-2:2)), measure(sign(-2:2)))
})
test_that("exp works", {
  expect_error(exp(measure(1:5, "m")), class = "measure_unitful")
  expect_equal(exp(measure(1:5)), measure(exp(1:5)))
  expect_warning(
    expect_equal(exp(measure(1:5/10, 10)), measure(exp(1:5))),
    class = "measure_assimilation"
  )
})
test_that("cumprod works", {
  expect_error(cumprod(measure(1:5, "m")), class = "measure_unitful")
  expect_equal(cumprod(measure(1:5)), measure(cumprod(1:5)))
  expect_warning(
    expect_equal(cumprod(measure(1:5/10, 10)), measure(cumprod(1:5))),
    class = "measure_assimilation"
  )
})
