magnitude = c(
  Q = 30L, R = 27L, Y = 24L, Z = 21L, E = 18L, P = 15L, T = 12L, G = 9L, M = 3L,
  k = 3L, h = 2L, da = 1L, d = -1L, c = -2L, m = -3L, "\u00B5" = -6L, n = -9L,
  p = -12L, f = -15L, a = -18L, z = -21L, y = -24L, r = -27L, q = -30L
)

mag <- function(x) {
  l <- integer(length(x))
  z <- nzchar(x)
  l[z] <- magnitude[x[z]]
  l
}

difftime_mag <- c(s = 1L, min = 60L, hour = 3600L, day = 86400L, week = 604800L)
difftime_units <- c(
  sec = "s", secs = "s", mins = "min",
  hours = "hour", days = "day", weeks = "week"
)
old_difftime_units <- c(
  s = "secs", sec = "secs", min = "mins", hour = "hours", week = "weeks", day = "days"
)

mag_diff <- function(prefices, not_first) mag(prefices[not_first]) - mag(prefices[[1]])

correct_units <- function(x) {
  if(mult(x) == 0) return(blank_units(0))

  new_difftime_units <- difftime_units[x]
  is_difftime_unit <- !is.na(new_difftime_units)
  x[is_difftime_unit] <- new_difftime_units[is_difftime_unit]

  unique_units <- unique(x)
  map_unique <- outer(x, unique_units, `==`)

  powers <- pow(x)
  powers_by_unique <- colSums(powers * map_unique)

  prefices <- pref(x)
  prefices_by_unique <- apply(map_unique, 2, \(i) prefices[i], simplify = FALSE)
  first_prefices <- vapply(prefices_by_unique, `[[`, character(1), 1)
  not_first_prefix <- .mapply(`!=`, list(prefices_by_unique, first_prefices), NULL)

  mag_diff_to_first <- .mapply(mag_diff, list(prefices_by_unique, not_first_prefix), NULL)
  power_mag <- \(i) mag_diff_to_first[[i]] * powers[map_unique[, i]][not_first_prefix[[i]]]
  mag_diff_powered <- lapply(seq_len(ncol(map_unique)), power_mag)
  mult <- mult(x) * 10^do.call(sum, mag_diff_powered)

  x <- new_units(unique_units, pow = powers_by_unique, pref = first_prefices, mult = mult)
  x[!(powers_by_unique == 0 | x == "1")]
}
