#' @title List all options for `expression`
#'
#' @description Return a character vector for all valid
#' options for the `expression` argument in `generate_ball()`
#'
#' @export
expression_options <- function(){
  expr_chr <- list.files(paste0(path.package("hkdistrictballs"), "/expr/"))
  expr_chr <- gsub(pattern = ".png", replacement = "", x = expr_chr)
  gsub(pattern = "expr-", replacement = "", x = expr_chr)
}
