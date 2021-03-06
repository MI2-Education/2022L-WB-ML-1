% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/KM2_Random_Forest.R
\name{RandomForest_predict}
\alias{RandomForest_predict}
\title{Predicts target variable using given preprocessed attributes}
\usage{
RandomForest_predict(model, data, target)
}
\arguments{
\item{model}{result model from RandomForest_function}

\item{data}{data preprocessed with preprocessing function}

\item{target}{string, name of the target column}
}
\value{
vector of predictions
}
\description{
Predicts target variable using given preprocessed attributes
}
\examples{
data     <- read.csv("./archive/lisbon-houses.csv")
data     <- preprocessing(data, "Price", to_scale = c("Bedrooms", "Bathrooms", "AreaNet", "AreaGross"))
data     <- train_test_split(data = data, target = "Price",  train_size = 0.7)
Xy_train <- cbind(data$train_x, data$train_y)
Xy_test  <- cbind(data$test_x, data$test_y)
X_train  <- data$train_x
X_test   <- data$test_x



rf <- RandomForest_function(
  data = Xy_train,
  target = "Price",
)

predictions_train <- RandomForest_predict(
  model = rf,
  data = X_train,
  target  = "Price"
)

predictions_test <- RandomForest_predict(
  model = rf,
  data = X_test,
  target  = "Price"
)

Metrics::rmse(Xy_train$Price, predictions_train)
Metrics::rmse(data$test_y$Price, predictions_test)
}
