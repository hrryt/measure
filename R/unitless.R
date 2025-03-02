get_unitless <- function(x) {
  u <- units(x)
  if(is.null(u)) return(x)
  if(!mult_only(u))
    cli::cli_abort("units must be trivial", class = "measure_unitful")
  if(mult(u) != 1) cli::cli_warn(
    "units of {.cls measure} object assimilated into its value",
    class = "measure_assimilation"
  )
  get_data(x) * mult(u)
}

unitless <- function(x) {
  units_blank(units(x))
}

units_blank <- function(x) {
  is.null(x) || (length(x) == 0 && mult(x) == 1)
}

mult_only <- function(x) length(x) == 0

blank_units <- function(m = 1) new_units(character(), integer(), character(), m)
