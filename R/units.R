is_units <- function(x) inherits(x, "units")

pow <- function(x) attr(x, "pow")
`pow<-` <- function(x, value) `attr<-`(x, "pow", value)
pref <- function(x) attr(x, "pref")
`pref<-` <- function(x, value) `attr<-`(x, "pref", value)
mult <- function(x) attr(x, "mult")
`mult<-` <- function(x, value) `attr<-`(x, "mult", value)

new_units <- function(x, pow, pref, mult) {
  class(x) <- "units"
  pow(x) <- pow
  pref(x) <- pref
  mult(x) <- mult
  x
}

#' @export
mtfrm.units <- function(x) unclass(x)

#' @export
`[.units` <- function(x, i) {
  new_units(NextMethod(), pow = pow(x)[i], pref = pref(x)[i], mult = mult(x))
}

#' @export
c.units <- function(...) {
  l <- list(...)
  if(!all(vapply(l, is_units, logical(1))))
    cli::cli_abort("all arguments must be {.cls units} objects")
  x <- new_units(
    NextMethod(),
    pow = do.call(c, lapply(l, pow)),
    pref = do.call(c, lapply(l, pref)),
    mult = do.call(prod, lapply(l, mult))
  )
  correct_units(x)
}
