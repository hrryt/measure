#' Mathematical Annotation of Measures
#'
#' Create a formula for [`plotmath`] plot annotation from a [`measure`] object.
#'
#' @param x a `measure` object or its `units()`
#' @param sub the main label, passed to [format()]
#' @returns A formula obeying `plotmath` syntax rules
#' @examples
#' x <- measure(1:5, "k|m s^-1")
#' plot_math(x)
#' plot(x)
#' plot(x, ylab = plot_math(x, "Speed"))
#'
#' @export
plot_math <- function(x, sub = substitute(x)) {
  UseMethod("plot_math")
}

plot_math_default <- function(fsub) {
  stats::as.formula(paste0("~`", fsub, "`"))
}

#' @export
plot_math.default <- function(x, sub = substitute(x)) {
  plot_math_default(format(sub))
}

plot_math_units <- function(x) {
  format(x, sep = "~", backtick = TRUE)
}

plot_math_measure <- function(fsub, u) {
  if(is.null(fsub) || !nzchar(fsub)) return(NULL)
  if(units_blank(u)) return(plot_math_default(fsub))
  stats::as.formula(paste0("`", fsub, "`~`/`~", plot_math_units(u)))
}

#' @export
plot_math.measure <- function(x, sub = substitute(x)) {
  fsub <- format(sub)
  plot_math_measure(fsub, units(x))
}

#' @export
plot_math.units <- function(x, sub = substitute(x)) {
  stats::as.formula(paste0("~", plot_math_units(x)))
}
