## Revenue for power plants

# Lag en funksjon som tar prisbanen samt årlig produksjon for et kraftverk som
# input, og returnerer inntekt per år for de årene som er tilgjengelig i
# prisbanen. Man kan gå ut ifra at årlig kraftproduksjon vil være stabil.

#' Calculate revenue
#'
#' Function that takes the price path as well as annual production for a power
#' plant as input, and returns revenue per year for the years available in the
#' price path.
#'
#' @param production
#' @param pricepath
#'
#' @return revenue per year for the years available in the price path
#' @export
exp_revenue_per_year <- function(production, pricepath) {
  revenue <- purrr::map_df(production, .f = production$Annual_pp * pricepath)
}
