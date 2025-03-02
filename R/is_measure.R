#' Check for and Coerce to Measure
#'
#' Check if an object inherits the `measure` class, or coerce to `measure`.
#'
#' `is.measure()` and `as.measure()` are aliases of `is_measure()` and
#' `as_measure()` respectively.
#'
#' @param x an R object
#' @returns For `is_measure()`, a logical value.
#' For `as_measure()`, the result of [measure()]
#'
#' @export
is_measure <- function(x) inherits(x, "measure")

#' @rdname is_measure
#' @export
is.measure <- is_measure

#' @rdname is_measure
#' @export
as_measure <- function(x) measure(x)

#' @rdname is_measure
#' @export
as.measure <- as_measure
