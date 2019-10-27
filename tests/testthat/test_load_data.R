# Testfile for load_data.R

context("Test of load_data_annual_pp")

testthat::test_that("Test that df has correct format", {
  df <- load_data_annual_pp()

  testthat::expect_type(df, "list")
})

context("Test of annual_pp")

testthat::test_that("Test that df has correct format", {
  df <- load_data_annual_pp()
  df_annual <- annual_pp(df)

  testthat::expect_type(df_annual, "list")
  testthat::expect_type(df_annual$Name, "character")
  testthat::expect_type(df_annual$Annual_pp, "double")
  # Under funker ikke, må fikse
  #testthat::expect_length(df_annual$Name, n = df$Navn)
  #testthat::expect_gte(df_annual$Annual_pp, 0)
})

