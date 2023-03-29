
#' Random Forest model
#'
#' Training a random forest model, use 10-fold cross validation without optimization
#'
#' @param df A Dataframe including observations and environmental covariates at samples locations
#' @param covariates Environmental covariates for the area of interest
#' @param variable_of_interest Name or abbreviation of the target variable available in "df" dataframe
#'
#' @return A Random Forest model with 10 fold cross-validation
#' @export
#'
#' @examples #in this example, Clay content in soil is intended to predict by random forest model
#' Clay_model<- RFmodel(df,covariates,variable_of_interest="Cl")
#' @author Fatemeh Hateffard and Luc Steinbuch

RFmodel <- function(df,covariates, variable_of_interest){

  ##check for missing values first
  df <- data.frame(df)[complete.cases(data.frame(df)),]

  set.seed(10)
  ctrl <- caret::trainControl(method = "cv",
                       number=10,
                       savePredictions = TRUE)
  set.seed(10)
  rfmodel <- caret::train(df[,names(covariates)],
                   df[, variable_of_interest],
                   method="rf",
                   importance=TRUE,
                   tuneGrid = expand.grid(mtry = 5),
                   trControl = ctrl)
  print("10 fold cross-validation performance:")
  print(rfmodel)

  return(rfmodel)
}






