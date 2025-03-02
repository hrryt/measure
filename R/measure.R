new_measure <- function(x = double(), units = blank_units()) {
  if(!is.double(x)) cli::cli_abort("{.var x} must be a {.cls double} object")
  if(!is_units(units)) cli::cli_abort("{.var units} must be a {.cls units} object")
  methods::new("measure", unclass(x), units = units)
}

units_useless <- function(x) all(x == 0 | is.infinite(x) | is.na(x))
zero_measure <- function(x = double(), units = blank_units()) {
  if(units_useless(x)) units <- blank_units()
  new_measure(x, units)
}

#' Measures
#'
#' A class and utility methods for numeric values with units
#'
#' @section Methods:
#'
#' If `x` is a `lubridate` Duration, Interval or Period object, it will be
#' converted to `difftime` before running the default method.
#'
#' If `x` is already a `measure` [convert_units()] will be called.
#'
#' @section Units:
#' Units are specified in the following format:
#'
#' `"multiplier prefix1|unit1^exponent1 prefix2|unit2^exponent2 ..."`.
#'
#' The multiplier, prefixes and exponents are optional. For example,
#' `measure(x, "10 c|m^2 s^-1")` will add units of ten centimeters per second,
#' and `measure(x, "m")` simply of meters. Prefixes can be any of the SI prefixes:
#'
#' `Q`, `R`, `Y`, `Z`, `E`, `P`, `T`, `G`, `M`, `k`, `h`, `da`, `d`, `c`, `m`, `µ`,
#' (or `micro`), `n`, `p`, `f`, `a`, `z`, `y`, `r`, or `q`.
#'
#' Units have no restriction, although [`difftime`] units are converted to
#' `s`, `min`, `hour`, `day` and `week`.
#'
#' @param x a numeric vector, or a `measure`, [`difftime`], [`lubridate::duration`],
#' [`lubridate::interval`], or [`lubridate::period`] object
#' @param units,value a character value. See Details
#' @returns An object of class `measure`
#' @seealso [scale_x_measure()]
#'
#' @export
measure <- function(x = double(), units = attr(x, "units")) {
  UseMethod("measure")
}
#' @export
measure.default <- function(x = double(), units = attr(x, "units")) {
  x_units <- attr(x, "units")
  mode(x) <- "double"
  units <- as_units(units)
  if(!is.null(x_units)) {
    x <- zero_measure(x, as_units(x_units))
    return(convert_units(x, units))
  }
  zero_measure(x, units)
}
#' @export
measure.measure <- function(x = double(), units = attr(x, "units")) {
  if(missing(units)) x else convert_units(x, units)
}
measure_difftime <- function(x = double(), units = attr(x, "units")) {
  x <- as.difftime(x)
  force(units)
  NextMethod()
}
#' @export
measure.Duration <- measure_difftime
#' @export
measure.Interval <- measure_difftime
#' @export
measure.Period <- measure_difftime
