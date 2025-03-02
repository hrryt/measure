test_that("difftime is correctly coerced to measure", {
  interval <- ISOdate(2001, 4, 26) - ISOdate(2001, 2, 26)
  rate <- measure(71, "m|m") / interval
  expect_equal(rate, measure(71/59, "m|m day^-1"))
  expect_equal(measure(interval, "secs"), measure(59*86400, "s"))
})
test_that("measure is correctly coerced to difftime", {
  interval <- ISOdate(2001, 4, 26) - ISOdate(2001, 2, 26)
  rate <- measure(71, "m|m") / interval
  secs <- as.difftime(measure(20, "n|m") / rate, units = "secs")
  expect_equal(secs, as.difftime(20/71*59*86400/1e6, units = "secs"))
})
test_that("difftime units are correctly converted", {
  interval <- ISOdate(2001, 4, 26) - ISOdate(2001, 2, 26)
  rate <- measure(71, "m|m") / interval
  expect_equal(measure(rate, "n|m s^-1"), measure(71/59/86400*1e6, "n|m s^-1"))
  min <- measure(1, "min")
  s <- measure(1, "s")
  expect_equal(min + s, measure(61/60, "min"))
  expect_equal(s + min, measure(61, "s"))
})
