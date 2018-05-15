#loading data
data=read.csv("50_Startups.csv")

# dealing with categorical data
data$State= factor(data$State,
                   levels=c('New York','California', 'Florida'),
                   labels = c(1,2,3))
#spliting data
library(caTools)
seed=123
split=sample.split(data$Profit, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
testing_set = subset(data, split == FALSE)

#making model
regressor = lm(formula = Profit ~ .,
              data= training_set)
#doing prediction
y_prediction = predict(regressor, newdata = testing_set)
summary(regressor)

# Backward elimination method
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data= training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data= training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data= training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend,
               data= training_set)
summary(regressor)