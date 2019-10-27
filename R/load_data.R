# Load data

#' Load data
#'
#' Function that loads data from power plants in Norway.
#'
#' @return a data from of annual production of power for all power plants
#' in Norway.
#' @examples
#' df <- load_data_annual_pp()
#' @export
load_data_annual_pp <- function() {
  df <- as.data.frame(jsonlite::fromJSON("https://www.nve.no/umbraco/api/Powerplant/GetHydroPowerPlantsInOperation"))
}

#' Annual Power Production
#'
#' Function that load data of power plant and power production.
#'
#' @return a data frame with name of power plant and annual power production
#' of the power plant.
#' @export
annual_pp <- function(df) {
  df <- df %>%
    dplyr::select(., c(Navn, MidProd_81_10)) %>%
    dplyr::transmute(.,
              Name = Navn,
              Annual_pp = MidProd_81_10*100000)
}

