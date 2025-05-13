#' @export
seq.measure <- function(from, to, by = ((to - from)/(length.out - 1)),
                        length.out = NULL, along.with = NULL, ...) {
  l <- list()
  f <- !missing(from)
  t <- !missing(to)
  b <- !missing(by)
  if(f) l$f <- from
  if(t) l$t <- to
  if(b) l$b <- by
  n <- normalize_units(l)
  l <- vector("list", 3)
  l[c(f, t, b)] <- lapply(n, get_data)
  if(f) from <- l[[1]]
  if(t) to <- l[[2]]
  if(b) by <- l[[3]]
  zero_measure(NextMethod(), normal_unit(n))
}

#' @export
Math.measure <- function(x, ...) {
  switch(
    .Generic,
    sign = new_measure(NextMethod()),
    sqrt = new_measure(NextMethod(), units(x)^0.5),
    exp = , log = , expm1 = , log1p = , cos = , sin = , tan = , cospi = ,
    sinpi = , tanpi = , acos = , asin = , atan = , cosh = , sinh = , tanh = ,
    acosh = , asinh = , atanh = , lgamma = , gamma = , digamma = , trigamma = ,
    cumprod = {
      x <- get_unitless(x)
      new_measure(NextMethod())
    },
    NextMethod()
  )
}

#' @export
mean.measure <- function(x, ...) {
  zero_measure(mean(get_data(x), ...), units(x))
}
