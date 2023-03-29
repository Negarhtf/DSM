
#'Overlay between observations and  environmental covariates
#'
#'Overlay and intersection between observations and  environmental covariates in the area of interest. It finds the covariates values at the locations of samples/Observations
#'
#' @param df Dataframe containing the observation, sampling points
#' @param covariates Environmental covariates for the area of interest
#'
#' @return A Dataframe with including your observations and environmental covariates at locations samples locations
#' @export
#' @examples
#' ##Load the environmental covariates in area
#' covariates <- load("Covariates")
#' ##Load the observations
#' df <- load("Observations")
#' m <- obs_cov_overlay(df,covariates)
#'
#' #OR use the data in this package as observations and covariates; the data related to Kenya
#' data(df_Ke_Cl)
#' data(Ke_covariates)
#' Ke_Cl <- obs_cov_overlay(df_Ke_Cl,Ke_covariates)
#'
#' @author Fatemeh Hateffard and Luc Steinbuch


obs_cov_overlay <- function(df, covariates){
  sp::coordinates(df) <- ~longitude + latitude
  sp::proj4string(df) <- sp::CRS("+init=epsg:4326")

  CRS.new <- raster::crs(covariates)

  df <- sp::spTransform(df, CRS.new)

  m <- raster::extract(covariates, df,sp = 1,
               method = "simple")

  m <- as.data.frame(m)

  return(m)
}
