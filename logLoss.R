#log loss function
# from: https://www.kaggle.com/c/predict-closed-questions-on-stack-overflow/forums/t/2421/multiclass-logloss-in-r/72939

#Note: this function requires actual to be dummies vars, one for each class
# to rapidly convert a vector with nums for each category to dummy codes,
# run the following
# based on: https://www.kaggle.com/c/emc-data-science/forums/t/2149/is-anyone-noticing-difference-betwen-validation-and-leaderboard-error
# library(dummies)
# testing_target_IndMat<-dummy.data.frame(data=as.data.frame(testing[,'target']), sep="_", verbose=T, dummy.class="ALL")
# str(testing_target_IndMat)


# to do:
  # add this code into the LogLoss function, so it does it automatically


LogLoss <- function(actual, predicted, eps=1e-15) {
  predicted[predicted < eps] <- eps;
  predicted[predicted > 1 - eps] <- 1 - eps;
  -1/nrow(actual)*(sum(actual*log(predicted)))
}