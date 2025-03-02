#' @export
`*.units` <- function(e1, e2) c(e1, e2)
#' @export
`/.units` <- function(e1, e2) c(e1, e2^-1)
#' @export
`^.units` <- function(e1, e2) {
  pow(e1) <- pow(e1) * e2
  mult(e1) <- mult(e1)^e2
  correct_units(e1)
}
