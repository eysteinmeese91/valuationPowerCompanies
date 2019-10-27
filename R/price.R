# Price

exp_power_price1 <- tibble::tibble(date = seq(lubridate::as_date("2019-12-31"),
                                              lubridate::as_date("2040-12-31"),
                                              by = "year"),
                                   power_price = c(0.30, 0.32, 0.35, 0.37, 0.38,
                                                   0.40, 0.41, 0.43, 0.43, 0.43,
                                                   0.43, 0.43, 0.43, 0.43, 0.43,
                                                   0.43, 0.43, 0.43, 0.43, 0.43,
                                                   0.43, 0.43))

exp_power_price2 <- tibble::tibble(date = seq(lubridate::as_date("2040-12-31"),
                                              lubridate::as_date("2097-12-31"),
                                              by = "year"),
                                   power_price = c(0.43))

pricepath <- rbind(exp_power_price1,exp_power_price2)

remove(exp_power_price1,exp_power_price2)

