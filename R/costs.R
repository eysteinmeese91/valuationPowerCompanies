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
                  depreciation = 0.2, production) {
  tibble::tibble(name = production$Name,
                 date = pricepath$date,
                 operating_cost = production$Annual_pp * operating_cost,
                 investments = production$Annual_pp * investments,
                 depreciation = production$Annual_pp * depreciation)
}


#aga_costs <- costs(pricepath = pricepath, production = aga)

