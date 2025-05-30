test_that("addition works", {
  w <- measure(3)
  x <- measure(1:5, "k|m^2 s^-1")
  y <- measure(6, "100 m^2 s^-1")
  z <- measure(1, "m s^-1")
  expect_equal(x + y, measure(1:5 + 6e-4, "k|m^2 s^-1"))
  expect_equal(y + x, measure(6 + 1:5*1e4, "100 m^2 s^-1"))
  expect_equal(w + 2, measure(5))
  expect_equal(w + 2L, measure(5))
  expect_equal(2 + w, measure(5))
  expect_equal(0 + x, x)
  expect_equal(x + 0, x)
  expect_error(x + z, class = "measure_incomparable")
  expect_error(x + 2, class = "measure_incomparable")
  expect_error(2 + x, class = "measure_incomparable")
  expect_equal(+x, x)
})
test_that("subtraction works", {
  w <- measure(3)
  x <- measure(1:5, "k|m^2 s^-1")
  y <- measure(6, "100 m^2 s^-1")
  z <- measure(1, "m s^-1")
  expect_equal(x - y, measure(1:5 - 6e-4, "k|m^2 s^-1"))
  expect_equal(y - x, measure(6 - 1:5*1e4, "100 m^2 s^-1"))
  expect_equal(w - 2, measure(1))
  expect_equal(2 - w, measure(-1))
  expect_equal(0 - x, measure(-(1:5), units(x)))
  expect_equal(x - 0, x)
  expect_error(x - z, class = "measure_incomparable")
  expect_error(x - 2, class = "measure_incomparable")
  expect_error(2 - x, class = "measure_incomparable")
  expect_equal(-x, measure(-(1:5), units(x)))
})
test_that("multiplication works", {
  x <- measure(1:6, "k|m^2 s^-1")
  y <- measure(2, "100 J mol^-1 K^-1")
  z <- measure(0.2, ".01 K J^-1 m^-1 s")
  expect_equal(x * y * z, measure(1:6 * 2 * 0.2, "1000 k|m mol^-1"))
  expect_equal(0 * x, measure(rep.int(0, 6)))
  expect_equal(x * 0, measure(rep.int(0, 6)))
})
test_that("division works", {
  x <- measure(1:6, "k|m^2 s^-1")
  y <- measure(2, "100 J mol^-1 K^-1")
  z <- measure(0.2, ".01 K J^-1 m^-1 s")
  expect_equal(x / y / z, measure(1:6 / 2 / 0.2, ".001 k|m^3 s^-2 mol"))
  expect_equal(0 / x, measure(rep.int(0, 6)))
  expect_equal(x / 0, measure(rep.int(Inf, 6)))
})
test_that("division works", {
  x <- measure(1:6, "k|m^2 s^-1")
  y <- measure(2, "100 J mol^-1 K^-1")
  z <- measure(0.2, ".01 K J^-1 m^-1 s")
  expect_equal(x / y / z, measure(1:6 / 2 / 0.2, ".001 k|m^3 s^-2 mol"))
  expect_equal(0 / x, measure(rep.int(0, 6)))
  expect_equal(x / 0, measure(rep.int(Inf, 6)))
})
test_that("integer division works", {
  x <- measure(1:6, "k|m^2 s^-1")
  y <- measure(pi, "100 J mol^-1 K^-1")
  z <- measure(0.2, ".01 K J^-1 m^-1 s")
  expect_equal(x %/% y %/% z, measure(1:6 %/% pi %/% 0.2, ".001 k|m^3 s^-2 mol"))
  expect_equal(0 %/% x, measure(rep.int(0, 6)))
  expect_equal(x %/% 0, measure(rep.int(Inf, 6)))
})
test_that("modulo works", {
  x <- measure(1:5, "10 m^2")
  expect_error(x %% 5, class = "measure_incomparable")
  expect_equal(x %% measure(30, "m^2"), measure(1:5 %% 3, "10 m^2"))
  expect_equal(0 %% x, measure(rep.int(0, 5)))
  expect_equal(x %% 0, measure(rep.int(NaN, 5)))
})
test_that("powers work", {
  x <- measure(1:5, "10 k|m^2 s^-1")
  x25 <- measure((1:5)^-2.5, "10^-2.5 k|m^-5 s^2.5")
  expect_equal(x^-2.5, x25)
  expect_equal(sqrt(x), measure(sqrt(1:5), "10^0.5 k|m s^-0.5"))
  expect_equal(x^0, measure(rep.int(1, 5)))
  expect_warning(expect_equal(x^measure(-.25, 10), x25), class = "measure_assimilation")
  expect_error(x^measure(-2.5, "m"), class = "measure_unitful")
})
