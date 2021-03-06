% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/KM2_Random_Forest.R
\name{null_exterminator}
\alias{null_exterminator}
\title{Deletes rows with missing value in target column and replaces missing values
with average or mode function}
\usage{
null_exterminator(data, target, missing_num = FALSE, missing_cat = FALSE)
}
\arguments{
\item{data}{data provided as list, matrix, data.table or data.frame}

\item{target}{string, name of the target column}

\item{missing_num}{additional parameter, value which describes missing value
for numeric observations (other than NA)}

\item{missing_cat}{additional parameter, value which describes missing value
for character observations (other than NA)}
}
\value{
returns data.frame object
}
\description{
Deletes rows with missing value in target column and replaces missing values
with average or mode function
}
\examples{
data <- read.csv("./archive/lisbon-houses.csv")
df   <- to_DataFrame(data, "Price")

nulls1  <- rep_len(c(1, 1, NA, 1, NA), nrow(df))
nulls2  <- rep_len(c("Lisboa", "Lisboa", "Lisboa", NA, "Lisboa", "Lisboa"), nrow(df))
nulls3  <- rep_len(c(1, NA, 1, 1, 1, 1, 1, 1), nrow(df))

df_null <- df
df_null["Id"]       <- nulls1
df_null["District"] <- nulls2
df_null["Price"]    <- nulls3
df_null

df_notnull <- null_exterminator(df_null, "Price")
df_notnull
nrow(df)
nrow(df_notnull)
}
