#' @export
format.units <- function(x, sep = " ", backtick = FALSE, ...) {
  m <- mult(x)
  if(mult_only(x)) return(if(m == 1) "" else format(m, ...))
  p <- pow(x)
  p[one <- (p == 1)] <- ""
  p[!one] <- paste0("^", p[!one])
  x <- paste0(pref(x), x)
  if(backtick) x <- paste0("`", x, "`")
  y <- paste0(x, p, collapse = sep)
  if(m == 1) return(y)
  paste(format(m, ...), y, sep = sep)
}

#' @export
#' @method as.character units
as.character.units <- function(x, ...) {
  format(x, ...)
}

#' @export
print.units <- function(x, ...) {
  cat(format(x, ...), "\n")
  invisible(x)
}

#' @export
format.measure <-  function(x, ...) {
  if(unitless(x)) return(NextMethod())
  paste(NextMethod(), format(units(x)))
}

#' @export
#' @method as.character measure
as.character.measure <- function(x, ...) {
  if(unitless(x)) return(NextMethod())
  paste(NextMethod(), as.character(units(x)))
}

#' @export
pillar_shaft.measure <- function(x, ...) {
  num_x <- pillar::num(get_data(x))
  u <- units(x)
  mult(u) <- pillar::num(mult(u))
  out <- if(unitless(x)) format(num_x) else
    paste(format(num_x), pillar::style_subtle(format(u)))
  pillar::new_pillar_shaft_simple(out, align = "right")
}
