test_that("the obs_cov_overlay works with taking a df and covariates",{


  # load our Rda file
  load(file = "testdata.Rda")
  m <- obs_cov_overlay(df_Ke_Cl,Ke_covariates)

  expect_type(m, "list")
  expect_true(ncol(m) == 40)
  expect_false(nrow(m) == 0)
  expect_true(nrow(m)== nrow(df_Ke_Cl))

})
