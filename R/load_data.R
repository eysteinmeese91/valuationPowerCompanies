# Load data

# required packages
library(tidyverse)

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
#' @param df a df collectet from NVE containing information about power plants.
#' @param name insert the name of the power plant you wish to examine.
#'
#' @return a data frame with name of power plants and annual power production
#' of the power plant.
#' @export
annual_pp <- function(df, name) {
  df <- df[df$Navn==name,] %>%
    dplyr::select(., c(Navn, MidProd_81_10)) %>%
    dplyr::transmute(.,
              Name = Navn,
              Annual_pp = MidProd_81_10*1000000)
}


