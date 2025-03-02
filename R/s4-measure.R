setClass("measure", contains = "numeric", slots = "units")

setGeneric("get_data", function(x) standardGeneric("get_data"))

#' @export
setGeneric("units", function(x) standardGeneric("units"))

#' @export
setGeneric("units<-", function(x, value) standardGeneric("units<-"))

setMethod("get_data", "measure", function(x) {
  out <- x@.Data
  attributes(out) <- attributes(x)
  attr(out, "units") <- NULL
  unclass(out)
})

#' @rdname measure
#' @export
setMethod("units", "measure", function(x) x@units)

#' @rdname measure
#' @export
setMethod("units<-", "measure", function(x, value) {
  x@units <- as_units(value)
  x
})

incomparable <- function(e) {
  if(inherits(e, "measure_incomparable")) return(TRUE)
  stop(e)
}

normalize_method <- function(e1, e2) {
  n <- normalize_units(list(e1, e2))
  zero_measure(do.call(.Generic, lapply(n, get_data)), normal_unit(n))
}

measure_e1 <- function(e1, e2) {
  e1 <- as_measure(e1)
  callGeneric()
}

measure_e2 <- function(e1, e2) {
  e2 <- as_measure(e2)
  callGeneric()
}

#' @export
setMethod("-", c(e1 = "measure", e2 = "measure"), normalize_method)

#' @export
setMethod("-", c(e1 = "measure", e2 = "missing"), function(e1, e2) {
  zero_measure(-get_data(e1), units(e1))
})

#' @export
setMethod("-", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("-", c(e1 = "ANY", e2 = "measure"), measure_e1)

#' @export
setMethod("+", c(e1 = "measure", e2 = "measure"), normalize_method)

#' @export
setMethod("+", c(e1 = "measure", e2 = "missing"), function(e1, e2) {
  zero_measure(+get_data(e1), units(e1))
})

#' @export
setMethod("+", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("+", c(e1 = "ANY", e2 = "measure"), measure_e1)

#' @export
setMethod("%%", c(e1 = "measure", e2 = "measure"), normalize_method)

#' @export
setMethod("%%", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("%%", c(e1 = "ANY", e2 = "measure"), measure_e1)

#' @export
setMethod("*", c(e1 = "measure", e2 = "measure"), function(e1, e2) {
  zero_measure(get_data(e1) * get_data(e2), units(e1) * units(e2))
})

#' @export
setMethod("*", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("*", c(e1 = "ANY", e2 = "measure"), measure_e1)

#' @export
setMethod("/", c(e1 = "measure", e2 = "measure"), function(e1, e2) {
  zero_measure(get_data(e1) / get_data(e2), units(e1) / units(e2))
})

#' @export
setMethod("/", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("/", c(e1 = "ANY", e2 = "measure"), measure_e1)

#' @export
setMethod("%/%", c(e1 = "measure", e2 = "measure"), function(e1, e2) {
  zero_measure(get_data(e1) %/% get_data(e2), units(e1) / units(e2))
})

#' @export
setMethod("%/%", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("%/%", c(e1 = "ANY", e2 = "measure"), measure_e1)

#' @export
setMethod("^", c(e1 = "measure", e2 = "numeric"), function(e1, e2) {
  zero_measure(get_data(e1) ^ e2, units(e1) ^ e2)
})

#' @export
setMethod("^", c(e1 = "measure", e2 = "ANY"), function(e1, e2) {
  e2 <- as.numeric(e2)
  callGeneric()
})

#' @export
setMethod("^", c(e1 = "ANY", e2 = "measure"), function(e1, e2) {
  e2 <- get_unitless(e2)
  callGeneric()
})

#' @export
setMethod("^", c(e1 = "measure", e2 = "measure"), function(e1, e2) {
  e2 <- get_unitless(e2)
  callGeneric()
})

#' @export
setMethod("Compare", c(e1 = "measure", e2 = "measure"), function(e1, e2) {
  failed <- tryCatch(error = incomparable, {
    n <- normalize_units(list(e1, e2))
    FALSE
  })
  if(failed) {
    out <- callGeneric(get_data(e1), get_data(e2))
    out[] <- switch(.Generic, `==` = FALSE, `!=` = TRUE, cli::cli_abort(
      ""
    ))
    return(out)
  }
  e1 <- get_data(n[[1]])
  e2 <- get_data(n[[2]])
  callGeneric()
})

#' @export
setMethod("Compare", c(e1 = "measure", e2 = "ANY"), measure_e2)

#' @export
setMethod("Compare", c(e1 = "ANY", e2 = "measure"), measure_e1)

prod_units <- function(i) units(i)^length(i)

#' @export
setMethod("Summary", c(x = "measure"), function(x, ..., na.rm = TRUE) {
  dots <- list(x, ...)
  switch(
    .Generic,
    prod = {
      dots <- lapply(dots, as_measure)
      zero_measure(
        do.call(prod, c(lapply(dots, get_data), list(na.rm = na.rm))),
        do.call(c, lapply(dots, prod_units))
      )
    }, range = , sum = , max = , min = {
      n <- normalize_units(dots)
      zero_measure(
        do.call(.Generic, c(lapply(n, get_data), list(na.rm = na.rm))),
        normal_unit(n)
      )
    }, {
      x <- get_data(x)
      callGeneric()
    }
  )
})

#' @export
setMethod("c", c(x = "measure"), function(x, ..., use.names = TRUE) {
  n <- normalize_units(list(x, ...))
  zero_measure(
    do.call(c, c(lapply(n, get_data), list(use.names = use.names))),
    normal_unit(n)
  )
})

#' @export
setMethod("show", c(object = "measure"), function(object) {
  cat("<measure[", length(object), "]>\n", sep = "")
  if(length(object) == 0) return(invisible(object))
  out <- format(object)
  names(out) <- names(object)
  print(out, quote = FALSE)
  invisible(object)
})

#' @export
setMethod("[<-", c(x = "measure"), function(x, i, j, ..., value) {
  n <- normalize_units(list(x, value))
  x <- get_data(n[[1]])
  value <- get_data(n[[2]])
  zero_measure(callGeneric(), normal_unit(n))
})

#' @export
setMethod("[", c(x = "measure"), function(x, i, j, ..., drop = TRUE) {
  u <- units(x)
  x <- get_data(x)
  zero_measure(callGeneric(), u)
})

#' @export
setMethod("[[", c(x = "measure"), function(x, ...) {
  u <- units(x)
  x <- get_data(x)
  zero_measure(callGeneric(), u)
})

#' @export
setMethod("[[<-", c(x = "measure"), function(x, ..., value) {
  n <- normalize_units(list(x, value))
  x <- get_data(n[[1]])
  value <- get_data(n[[2]])
  zero_measure(callGeneric(), normal_unit(n))
})

#' @export
setMethod("length<-", c(x = "measure"), function(x, value) {
  u <- units(x)
  x <- get_data(x)
  zero_measure(callGeneric(), u)
})

#' @export
setMethod("rep", c(x = "measure"), function(x, ...) {
  u <- units(x)
  x <- get_data(x)
  zero_measure(callGeneric(), u)
})

#' @export
setGeneric("rep_len")

#' @export
setMethod("rep_len", c(x = "measure"), function(x, length.out) {
  u <- units(x)
  x <- get_data(x)
  zero_measure(callGeneric(), u)
})

#' @importMethodsFrom lubridate as.difftime
#' @export
setMethod(
  "as.difftime", c(tim = "measure"),
  function(tim, format = "%X", units = "auto", tz = "UTC") {
    if(!missing(format)) cli::cli_warn("{.var format} argument ignored")
    if(units == "auto") {
      m <- mult(units(tim))
      tim <- tim * m
      mult(units(tim)) <- 1
      u <- as.character(units(tim))
      units <- old_difftime_units[u]
      if(is.na(units)) units <- u
    } else {
      tim <- convert_units(tim, units)
    }
    tim <- get_data(tim)
    as.difftime(tim, units = units, tz = tz)
  }
)

plot_measure <- function(
    x, y = NULL, type = "p", xlim = NULL, ylim = NULL,
    log = "", main = NULL, sub = NULL,
    xlab = NULL,
    ylab = NULL,
    ann = par("ann"), axes = TRUE, frame.plot = axes,
    panel.first = NULL, panel.last = NULL, asp = NA,
    xgap.axis = NA, ygap.axis = NA,
    ...) {
  m <- match.call()
  m[[1L]] <- quote(plot.default)
  if(missing(y)) {
    m$y <- NULL
    if(missing(ylab)) m$ylab <- plot_math(x, substitute(x, parent.frame()))
  } else {
    if(missing(xlab)) m$xlab <- plot_math(x, substitute(x, parent.frame()))
    if(missing(ylab)) m$ylab <- plot_math(y, substitute(y, parent.frame()))
  }
  eval.parent(m)
}

#' @export
setMethod("plot", c(x = "measure", y = "measure"), plot_measure)

#' @export
setMethod("plot", c(x = "measure"), plot_measure)

#' @export
setMethod("plot", c(y = "measure"), plot_measure)
