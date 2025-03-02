#' @title Scales for Measure Data
#' @description `ggplot2` scales that add units from `measure` objects to their aesthetic labels
#' @param ... passed to the corresponding `ggplot2` scale function of `*_measure()`, such as [ggplot2::scale_x_continuous()]
#' @returns The result of [`enmeasure_scale`]`(scale_*(...))`
#' @rdname scale_measure
#' @export
scale_linewidth_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_fill_fermenter_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_fermenter(...))
}

#' @rdname scale_measure
#' @export
scale_linetype_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linetype_manual(...))
}

#' @rdname scale_measure
#' @export
scale_color_viridis_b_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_viridis_b(...))
}

#' @rdname scale_measure
#' @export
scale_color_viridis_c_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_viridis_c(...))
}

#' @rdname scale_measure
#' @export
scale_color_viridis_d_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_viridis_d(...))
}

#' @rdname scale_measure
#' @export
scale_fill_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_identity(...))
}

#' @rdname scale_measure
#' @export
scale_size_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_linetype_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linetype_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_color_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_shape_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_shape_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape_binned(...))
}

#' @rdname scale_measure
#' @export
scale_y_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_colour_grey_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_grey(...))
}

#' @rdname scale_measure
#' @export
scale_colour_gradient2_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_gradient2(...))
}

#' @rdname scale_measure
#' @export
scale_fill_grey_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_grey(...))
}

#' @rdname scale_measure
#' @export
scale_fill_distiller_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_distiller(...))
}

#' @rdname scale_measure
#' @export
scale_colour_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_identity(...))
}

#' @rdname scale_measure
#' @export
scale_y_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_date(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_fill_steps_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_steps(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_manual(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_binned(...))
}

#' @rdname scale_measure
#' @export
scale_size_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_binned(...))
}

#' @rdname scale_measure
#' @export
scale_fill_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_x_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_y_time_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_time(...))
}

#' @rdname scale_measure
#' @export
scale_color_steps_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_steps(...))
}

#' @rdname scale_measure
#' @export
scale_y_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_colour_viridis_b_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_viridis_b(...))
}

#' @rdname scale_measure
#' @export
scale_colour_viridis_c_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_viridis_c(...))
}

#' @rdname scale_measure
#' @export
scale_colour_viridis_d_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_viridis_d(...))
}

#' @rdname scale_measure
#' @export
scale_size_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_x_log10_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_log10(...))
}

#' @rdname scale_measure
#' @export
scale_color_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_colour_stepsn_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_stepsn(...))
}

#' @rdname scale_measure
#' @export
scale_color_gradient_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_gradient(...))
}

#' @rdname scale_measure
#' @export
scale_discrete_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_discrete_manual(...))
}

#' @rdname scale_measure
#' @export
scale_x_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_binned(...))
}

#' @rdname scale_measure
#' @export
scale_fill_steps2_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_steps2(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth(...))
}

#' @rdname scale_measure
#' @export
scale_color_gradient2_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_gradient2(...))
}

#' @rdname scale_measure
#' @export
scale_fill_gradient_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_gradient(...))
}

#' @rdname scale_measure
#' @export
scale_color_grey_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_grey(...))
}

#' @rdname scale_measure
#' @export
scale_colour_gradientn_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_gradientn(...))
}

#' @rdname scale_measure
#' @export
scale_size_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_size_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_identity(...))
}

#' @rdname scale_measure
#' @export
scale_color_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_colour_steps_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_steps(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_linetype_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linetype_identity(...))
}

#' @rdname scale_measure
#' @export
scale_size_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_color_fermenter_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_fermenter(...))
}

#' @rdname scale_measure
#' @export
scale_fill_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_x_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_color_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_date(...))
}

#' @rdname scale_measure
#' @export
scale_colour_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_binned(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_fill_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_identity(...))
}

#' @rdname scale_measure
#' @export
scale_shape_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_color_brewer_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_brewer(...))
}

#' @rdname scale_measure
#' @export
scale_x_sqrt_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_sqrt(...))
}

#' @rdname scale_measure
#' @export
scale_size_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_manual(...))
}

#' @rdname scale_measure
#' @export
scale_size_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_date(...))
}

#' @rdname scale_measure
#' @export
scale_colour_gradient_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_gradient(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_manual(...))
}

#' @rdname scale_measure
#' @export
scale_fill_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_binned(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_identity(...))
}

#' @rdname scale_measure
#' @export
scale_size_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_fill_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_date(...))
}

#' @rdname scale_measure
#' @export
scale_color_distiller_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_distiller(...))
}

#' @rdname scale_measure
#' @export
scale_continuous_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_continuous_identity(...))
}

#' @rdname scale_measure
#' @export
scale_colour_hue_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_hue(...))
}

#' @rdname scale_measure
#' @export
scale_color_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_manual(...))
}

#' @rdname scale_measure
#' @export
scale_color_stepsn_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_stepsn(...))
}

#' @rdname scale_measure
#' @export
scale_linetype_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linetype_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_color_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_x_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_color_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_binned(...))
}

#' @rdname scale_measure
#' @export
scale_shape_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape(...))
}

#' @rdname scale_measure
#' @export
scale_y_log10_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_log10(...))
}

#' @rdname scale_measure
#' @export
scale_colour_brewer_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_brewer(...))
}

#' @rdname scale_measure
#' @export
scale_fill_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_fill_stepsn_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_stepsn(...))
}

#' @rdname scale_measure
#' @export
scale_colour_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_fill_viridis_b_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_viridis_b(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_date(...))
}

#' @rdname scale_measure
#' @export
scale_fill_viridis_c_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_viridis_c(...))
}

#' @rdname scale_measure
#' @export
scale_fill_viridis_d_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_viridis_d(...))
}

#' @rdname scale_measure
#' @export
scale_shape_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_colour_distiller_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_distiller(...))
}

#' @rdname scale_measure
#' @export
scale_x_reverse_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_reverse(...))
}

#' @rdname scale_measure
#' @export
scale_colour_ordinal_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_ordinal(...))
}

#' @rdname scale_measure
#' @export
scale_fill_brewer_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_brewer(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_binned(...))
}

#' @rdname scale_measure
#' @export
scale_alpha_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_alpha_date(...))
}

#' @rdname scale_measure
#' @export
scale_size_area_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_area(...))
}

#' @rdname scale_measure
#' @export
scale_colour_steps2_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_steps2(...))
}

#' @rdname scale_measure
#' @export
scale_type_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_type(...))
}

#' @rdname scale_measure
#' @export
scale_colour_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_manual(...))
}

#' @rdname scale_measure
#' @export
scale_color_gradientn_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_gradientn(...))
}

#' @rdname scale_measure
#' @export
scale_fill_hue_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_hue(...))
}

#' @rdname scale_measure
#' @export
scale_linetype_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linetype_binned(...))
}

#' @rdname scale_measure
#' @export
scale_x_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_date(...))
}

#' @rdname scale_measure
#' @export
scale_shape_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape_manual(...))
}

#' @rdname scale_measure
#' @export
scale_radius_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_radius(...))
}

#' @rdname scale_measure
#' @export
scale_color_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_identity(...))
}

#' @rdname scale_measure
#' @export
scale_x_time_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_x_time(...))
}

#' @rdname scale_measure
#' @export
scale_color_steps2_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_steps2(...))
}

#' @rdname scale_measure
#' @export
scale_fill_manual_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_manual(...))
}

#' @rdname scale_measure
#' @export
scale_colour_fermenter_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_fermenter(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_discrete_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_discrete(...))
}

#' @rdname scale_measure
#' @export
scale_linewidth_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linewidth_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_fill_gradientn_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_gradientn(...))
}

#' @rdname scale_measure
#' @export
scale_y_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_shape_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_shape_identity(...))
}

#' @rdname scale_measure
#' @export
scale_color_hue_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_color_hue(...))
}

#' @rdname scale_measure
#' @export
scale_y_sqrt_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_sqrt(...))
}

#' @rdname scale_measure
#' @export
scale_y_binned_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_binned(...))
}

#' @rdname scale_measure
#' @export
scale_colour_datetime_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_datetime(...))
}

#' @rdname scale_measure
#' @export
scale_y_reverse_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_y_reverse(...))
}

#' @rdname scale_measure
#' @export
scale_fill_gradient2_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_fill_gradient2(...))
}

#' @rdname scale_measure
#' @export
scale_colour_date_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_date(...))
}

#' @rdname scale_measure
#' @export
scale_linetype_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_linetype(...))
}

#' @rdname scale_measure
#' @export
scale_size_binned_area_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_size_binned_area(...))
}

#' @rdname scale_measure
#' @export
scale_discrete_identity_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_discrete_identity(...))
}

#' @rdname scale_measure
#' @export
scale_colour_continuous_measure <- function(...) {
  enmeasure_scale(ggplot2::scale_colour_continuous(...))
}

#' @rdname scale_measure
#' @export
scale_x_measure <- scale_x_continuous_measure

#' @rdname scale_measure
#' @export
scale_y_measure <- scale_y_continuous_measure

#' @rdname scale_measure
#' @export
scale_color_measure <- scale_color_continuous_measure

#' @rdname scale_measure
#' @export
scale_colour_measure <- scale_colour_continuous_measure

#' @rdname scale_measure
#' @export
scale_fill_measure <- scale_fill_continuous_measure

