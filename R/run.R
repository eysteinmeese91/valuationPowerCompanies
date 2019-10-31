# Script to calculate NPV for a company
# run devtools::load_all() before starting the scipt.

# FIRST, load data from NVE containing information about power plants.
data <- load_data_annual_pp()

# SECOND, insert the name of the power plant you wish to examine.
powerplant <- "Aall-Ulefoss"

# Next, Run these codes
production <- annual_pp(data, powerplant)
revenue <- exp_revenue_per_year(production = production,
                                pricepath = pricepath)
# Default values in cost function:
  # Operating_cost = 0.3
  # investments = 0.2
  # depreciation = 0.2
# IF other, insert in function below.
costs <- costs(production = production,
               pricepath = pricepath)

# Default value for tax is 0.22. If other, insert in function below.
cashflows <- cashflow(df_revenue = revenue,
                      df_costs = costs)

# Default values in wacc-function:
  # asset_beta = 0.6
  # risk_free_rate = 0.02,
  # market_risk_prem = 0.05,
  # other_adj = 0.02,
  # debt_prem = 0.025,
  # debt_share = 0.5,
  # corp_income_tax = 0.22,
  # inflation = 0.02
# IF other, insert in function below.
wacc <- wacc(cashflow = cashflows)

# NPV
npv_firm <- npv(cf = cashflows, wacc = wacc)

npv_firm

