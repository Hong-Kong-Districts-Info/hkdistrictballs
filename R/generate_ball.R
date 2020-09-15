#' @title Generate a basic District Ball image
#'
#' @description Generate a basic District Ball image by
#' specifying parameters for the district and the expression of the ball.
#'
#' @param district character string specifying the district. Valid inputs include "central-and-western",
#' "eastern", "islands", "kowloon-city", "kwai-tsing", "kwun-tong", "north", "sai-kung", "sha-tin", "sham-shui-po",
#' "southern", "tai-po", "tsuen-wan", "tuen-mun", "wan-chai", "wong-tai-sin", "yau-tsim-mong", and "yuen-long".
#' Defaults to "blank".
#' @param expression character string specifying the facial expression. Valid inputs include "fierce",
#' "happy", "normal", "sad", "skeptical".
#' @param scale numeric value. Size of the image to scale to. Defaults to 200.
#' @param vjust numeric value. Adjust the vertical position of the expression.
#' @param hjust numeric value. Adjust the horizontal of the expression.
#' @param bg_colour character string. HEX code for the background colour.
#' @param caption character string. Caption to appear at top of image. Defaults to blank.
#' @param caption_colour character string. HEX code for the caption colour.
#' @param caption_size numeric value. Text size of the caption.
#'
#' @examples
#' \dontrun{
#' # Run a Kowloon City ball, fierce expression, scale to 500
#' generate_ball("kowloon-city",
#'               "fierce",
#'               scale = 500,
#'               vjust = 1.0,
#'               caption = "We need cleaner streets!",
#'               caption_size = 30)
#' }
#'
#' @export
generate_ball <- function(district = "blank",
                          expression = "happy",
                          scale = 200,
                          vjust = 1,
                          hjust = 1,
                          bg_colour = "#FFFFFF",
                          caption = "",
                          caption_colour = "#000000",
                          caption_size = 20){
  # Process variables
  ball_png <- paste0(district, ".png")
  expr_png <- paste0("expr-", expression, ".png")
  scale_chr <- as.character(scale)
  vjust_str <- scale * (1 / vjust)
  hjust_str <- scale * (1 / hjust)
  expr_loc <- paste0(hjust_str, "x", vjust_str)


  plot_ball <- magick::image_read(paste0(path.package("hkdistrictballs"), "/balls/", ball_png))
  plot_ball <- magick::image_scale(plot_ball, geometry = scale_chr)
  plot_ball <- magick::image_background(plot_ball, color = bg_colour)

  plot_expr <- magick::image_read(paste0(path.package("hkdistrictballs"), "/expr/", expr_png))
  plot_expr <- magick::image_scale(plot_expr, geometry = scale_chr)
  plot_expr <- magick::image_extent(plot_expr, geometry = expr_loc)

  output_plot <- magick::image_flatten(c(plot_ball, plot_expr))
  magick::image_annotate(output_plot,
                         caption,
                         size = caption_size,
                         gravity = "North",
                         color = caption_colour,
                         font = "Trebuchet")
}
