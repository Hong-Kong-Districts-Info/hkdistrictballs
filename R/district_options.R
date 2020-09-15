#' @title List all options for `district`
#'
#' @description Return a character vector for all valid
#' options for the `district` argument in `generate_ball()`
#'
#' @export
district_options <- function(){
  district_chr <- list.files(paste0(path.package("hkdistrictballs"), "/balls/"))
  gsub(pattern = ".png",
       replacement = "",
       x = district_chr)
}


