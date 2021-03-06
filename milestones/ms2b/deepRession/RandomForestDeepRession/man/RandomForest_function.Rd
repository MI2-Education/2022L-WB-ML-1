% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/KM2_Random_Forest.R
\name{RandomForest_function}
\alias{RandomForest_function}
\title{Build a random forest model with given preprocessed data. Use a ranger library
 and let change its most important hyperparameter.}
\usage{
RandomForest_function(
  data,
  target,
  num.trees = 500,
  max.depth = NULL,
  min.node.size = NULL,
  mtry = NULL,
  splitrule = NULL,
  seed = NULL
)
}
\arguments{
\item{data}{data preprocessed with "preprocessing" function}

\item{target}{string, name of the target column}

\item{num.trees}{number of trees in model, default 500.}

\item{max.depth}{Maximal tree depth. A value of NULL or 0 (the default)
corresponds to unlimited depth, 1 to tree stumps (1 split per tree).}

\item{min.node.size}{Minimal node size. Default 1 for classification,
5 for regression, 3 for survival, and 10 for probability.}

\item{mtry}{Number of variables to possibly split at in each node.
Default is the (rounded down) square root of the number
variables. Alternatively, a single argument function
returning an integer, given the number of independent
variables.}

\item{splitrule}{Splitting rule. For classification and probability
estimation "gini", "extratrees" or "hellinger" with
default "gini". For regression "variance", "extratrees",
"maxstat" or "beta" with default "variance".}

\item{seed}{Random seed. Default is NULL, which generates the seed
from R. Set to 0 to ignore the R seed.}
}
\value{
random forest model ready to predict target
}
\description{
Build a random forest model with given preprocessed data. Use a ranger library
 and let change its most important hyperparameter.
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
rf
}
