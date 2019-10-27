# Costs

#' Calculate costs
#'
#' Function that calculates costs per year for a power plant.
#'
#' @param pricepath
#' @param operating_cost
#' @param investments
#' @param depreciation
#' @param annual_powerprod
#'
#' @return Returns operating costs, investment costs and depreciation per year,
#' for as many years as are included in the pricepath.
#' @export
costs <- function(pricepath, operating_cost = 0.3, investments = 0.2,
                  depreciation = 0.2, annual_powerprod) {
  costs_per_year <- pricepath
}
