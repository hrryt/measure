# .onLoad <- function(libname, pkgname) {
#   op <- options()
#   op.measure <- list(
#     measure.conversions = conversions(
#       s ~ min/60 ~ hour/3600 ~ day/86400 ~ week/604800
#     )
#   )
#   toset <- !(names(op.measure) %in% names(op))
#   if (any(toset)) options(op.measure[toset])
#   invisible()
# }

#' Convert Units
#'
#' Convert the units of a `measure` object to newly specified units.
#'
#' @param x a [`measure`] object
#' @param units a character value
#' @returns A `measure` object with new units
#'
#' @export
convert_units <- function(x, units) {
  x <- as_measure(x)
  u <- as_units(units)
  if(units_useless(get_data(x))) return(x)
  d <- units(x) / u
  if(mult_only(d)) return(zero_measure(get_data(x) * mult(d), u))
  if(!all(d %in% names(difftime_mag))) {
    cli::cli_abort("units are not comparable", class = "measure_incomparable")
  }
  mags <- difftime_mag[d]^pow(d)
  d[] <- "s"
  mult(d) <- prod(mult(d), mags)
  d <- correct_units(d)
  if(mult_only(d)) return(zero_measure(get_data(x) * mult(d), u))
  cli::cli_abort("units are not comparable", class = "measure_incomparable")
}
