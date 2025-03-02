as_units <- function(x) {
  if(is_units(x)) return(x)
  if(is.null(x)) return(blank_units())
  if(is.numeric(x) || is.complex(x) || is.logical(x)) return(blank_units(x))
  x <- as.character(x)
  x <- strsplit(do.call(c, strsplit(x, " ")), "^", fixed = TRUE)
  v <- vapply(x, `[[`, character(1), 1)
  has_prefix <- grepl("|", v, fixed = TRUE)
  prefix <- strsplit(v[has_prefix], "|", fixed = TRUE)
  v[has_prefix] <- vapply(prefix, `[[`, character(1), 2)
  prefices <- character(length(v))
  prefices[has_prefix] <- vapply(prefix, `[[`, character(1), 1)
  prefices[prefices == "micro"] <- "\u00B5"
  suppressWarnings(m <- as.numeric(v))
  not_mult <- is.na(m)
  mult <- !not_mult
  p <- as.numeric(vapply(x, `[`, character(1), 2))
  p[is.na(p)] <- 1
  x <- new_units(
    v[not_mult],
    pow = p[not_mult],
    pref = prefices[not_mult],
    mult = prod(m[mult]^p[mult])
  )
  correct_units(x)
}
