#log loss function
# from: https://www.kaggle.com/c/predict-closed-questions-on-stack-overflow/forums/t/2421/multiclass-logloss-in-r/72939

LogLoss <- function(actual, predicted, eps=1e-15) {
  predicted[predicted < eps] <- eps;
  predicted[predicted > 1 - eps] <- 1 - eps;
  -1/nrow(actual)*(sum(actual*log(predicted)))
}