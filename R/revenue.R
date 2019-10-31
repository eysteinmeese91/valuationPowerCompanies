## Revenue for power plants

#' Calculate revenue for all companies
#'
#' Function that takes the price path as well as annual production for a power
#' plant as input, and returns revenue per year for the years available in the
#' price path. The function iterates over the entire list of companies
#' that are in the input-vector.
#'
#' @param production df of companies and annual production
#' @param pricepath df of dates and pricepath of power forward in time
#'
#' @return revenue per year for the years available in the price path
#' @export
# exp_revenue_per_year_all <- function(production, pricepath) {
#   purrr::map(production$Name,
#                 .f = tibble::tibble(name = production$Name,
#                                     date = pricepath$date,
#                                     revenue = production$Annual_pp * pricepath$power_price))
# }

#' Calculate revenue for one company
#'
#' Function that takes the price path as well as annual production for a power
#' plant as input, and returns revenue per year for the years available in the
#' price path. Caculates revenue for one company.
#'
#' @param production df of companies and annual production
#' @param pricepath df of dates and pricepath of power forward in time
#'
#' @return revenue per year for the years available in the price path
#' @export
exp_revenue_per_year <- function(production, pricepath) {
  tibble::tibble(name = production$Name,
                 date = pricepath$date,
                 revenue = production$Annual_pp * pricepath$power_price)
}

## Testing
# rev_for_10 <- df_annual[1:10,]
#
# revenue <- exp_revenue_per_year(production = aga, pricepath = pricepath)
#
# rev <- exp_revenue_per_year(aga, pricepath)
