##  Script for functions for Cashflow, WACC and NPV.

#' Cashflow
#'
#' Function that calculates cashflow for the company.
#'
#' @param df_revenue df with annual revenue for the company.
#' @param df_costs df with annual costparameters for the company.
#' @param tax taxrate of the EBIT for the company.
#'
#' @return a tibble including name of company, year and cashflow that
#' corresponding year
#' @export
cashflow <- function(df_revenue, df_costs, tax = 0.22) {
  tibble::tibble(name = df_revenue$name,
                 year = format(as.Date(df_revenue$date, format="%Y/%m/%d"),"%Y"),
                 number = 1:nrow(df_revenue),
                 cashflow = df_revenue$revenue - df_costs$operating_cost -
                   (df_revenue$revenue - df_costs$operating_cost) * tax -
                   df_costs$investments + df_costs$depreciation)
}
#'
#' @examples
#' cashflows <- cashflow(df_revenue = aga_revenue, df_costs = aga_costs)


#' @title WACC
#'
#' Function that calculates the total weighted average cost of capital (WACC)
#' for a specific power plant.
#'
#' @param cashflows estimated future cashflow for the company.
#' @param asset_beta asseta beta for the company.
#' @param risk_free_rate risk-free rate of production for the company.
#' @param market_risk_prem Market risk premium for operating for the company.
#' @param other_adj Other adjustment for the company.
#' @param debt_prem Debt premium for the company.
#' @param debt_share Debt share for the company.
#' @param corp_income_tax Corporation income tax for the company.
#' @param inflation Rate of inflation in the economy.
#'
#' @return Returns the real total weighted average cost of capital (WACC) in
#' percent.
#' @export
wacc <- function(cashflow, asset_beta = 0.6, risk_free_rate = 0.02,
                 market_risk_prem = 0.05, other_adj = 0.02,
                 debt_prem = 0.025, debt_share = 0.5,
                 corp_income_tax = 0.22, inflation = 0.02) {
  tibble::tibble(name = cashflow$name[1],
                 equity_beta = asset_beta * (1 + (debt_share/(1 - debt_share))),
                 cost_of_equity = risk_free_rate + other_adj +
                   market_risk_prem*equity_beta,
                 cost_of_debt = (risk_free_rate + debt_prem) *
                   (1 - corp_income_tax),
                 cost_of_capital = (cost_of_equity * (1 - debt_share)) +
                   (cost_of_debt*debt_share),
                 wacc = ((1 + cost_of_capital)/(1 + inflation)) - 1)
}


#' Net Present Value
#'
#' Function that calculates the Net Present Value (NPV) of a firm.
#'
#' @param cf df with cashflows for the firm.
#' @param wacc a number in percent, the real total weighted average cost of
#' capital (WACC).
#'
#' @return the NPV for a firm at time 0.
#' @export
npv <- function(cf, wacc) {
  tibble::tibble(Name = cf$name[1],
                 NPV = sum(cf$cashflow/((1+wacc$wacc)^cf$number)))
}


