# Price

pricepath <- tibble::tibble(date = seq(lubridate::as_date("2019-12-31"),
                                              lubridate::as_date("2098-12-31"),
                                              by = "year"),
                                   power_price = c(0.30, 0.32, 0.35, 0.37, 0.38,
                                                   0.40, 0.41, rep(0.43,73)))

save(pricepath, file="data/pricepath.rda")


