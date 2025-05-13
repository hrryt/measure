new_scale_measure_class <- function(super) {
  paste0(class(super)[1], "Measure")
}

#' Add Units to A Scale
#'
#' Create a [`ggplot2::ggproto`] object that inherits from `super`, designed
#' to be a `ggplot2` scale for `measure` objects that adds units to the
#' aesthetic label.
#'
#' `make_title()` is redefined to return a formula derived from
#' `super$make_title()` and `units`. See [plot_math()].
#'
#' `transform()` is redefined to set `units` to `units(x)` and pass a plain
#' `double` to `super$transform()`.
#'
#' @param super a [`ggplot2::Scale`] object returned from a `scale_*()` function
#' like [ggplot2::scale_x_continuous()]
#' @returns A [`ggplot2::Scale`] object
#' @seealso [scale_x_measure()]
#' @examples
#' library(ggplot2)
#' p <- ggplot(mpg, aes(measure(displ, "L"))) + geom_histogram()
#' s <- scale_x_continuous("Engine displacement")
#' p + enmeasure_scale(s)
#'
#' @export
enmeasure_scale <- function(super) {
  ggplot2::ggproto(
    new_scale_measure_class(super), super,
    units = blank_units(),
    make_title = function(title, self = self) {
      title <- ggplot2::ggproto_parent(super, self)$make_title(title)
      plot_math_measure(title, self$units)
    },
    transform = function(x, self = self) {
      if(is_measure(x)) {
        self$units <- units(x)
        x <- get_data(x)
      }
      ggplot2::ggproto_parent(super, self)$transform(x)
    }
  )
}

# scale_measure <- "#' @title Scales for Measure Data
# #' @description `ggplot2` scales that add units from `measure` objects to their aesthetic labels
# #' @param ... passed to the corresponding `ggplot2` scale function of `*_measure()`, such as [ggplot2::scale_x_continuous()]
# #' @returns The result of [`enmeasure_scale`]`(scale_*(...))`
# #' @name scale_measure
# "
# cat(
#   file = "R/scale_measure.R", sep = "", scale_measure,
#   do.call(paste0, lapply(
#     Filter(\(i) startsWith(i, "scale_"), getNamespaceExports("ggplot2")), sprintf,
#     fmt = "#' @rdname scale_measure\n#' @export\n%1$s_measure <- function(...) {\n  enmeasure_scale(ggplot2::%1$s(...))\n}\n\n"
#   )),
#   do.call(paste0, lapply(
#     c("x", "y", "color", "colour", "fill"), sprintf,
#     fmt = "#' @rdname scale_measure\n#' @export\nscale_%1$s_measure <- scale_%1$s_continuous_measure\n\n"
#   ))
# )
