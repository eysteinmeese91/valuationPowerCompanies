# Costs

#' Calculate costs
#'
#' Function that calculates costs per year for a power plant.
#'
#' @param pricepath pricepath the next 80 years for 1 kwh power.
#' @param operating_cost operating cost for 1 Kwh power.
#' @param investments Investmens cost for 1 Kwh power.
#' @param depreciation depreciation per 1 kwh power produced.
#' @param annual_powerprod annual powerproduction for the company
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

