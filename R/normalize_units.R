normal_unit <- function(x) attr(x, "normal_unit")
normalize_units <- function(x) {
  x <- lapply(x, as_measure)
  u <- lapply(x, units)
  x_data <- lapply(x, get_data)
  useless <- vapply(x_data, units_useless, logical(1))
  unit <- if(!all(useless)) u[!useless][[1]] else u[[1]]
  structure(lapply(x, convert_units, unit), normal_unit = unit)
}
