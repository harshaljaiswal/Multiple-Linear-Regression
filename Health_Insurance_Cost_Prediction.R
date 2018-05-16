# loading the dataset
data= read.csv("insurance.csv")

# handling the categorical variables
print(unique(data$region))
data$region = factor(data$region,
                     levels = c('northeast', 'northwest', 'southeast', 'southwest'),
                     labels = c(1,2,3,4))
print(unique(data$smoker))
data$smoker = factor(data$smoker,
                     levels = c('no', 'yes'),
                     labels = c(1,2))
print(unique(data$sex))
data$sex = factor(data$sex,
                     levels = c('female', 'male'),
                     labels = c(1,2))
# Spliting the data
library('caTools')
seed=123
split = sample.split(data$charges, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
testing_set = subset(data, split == FALSE)

#Training the model
regressor = lm(formula = charges ~ .,
               data = training_set)
# prediction of model
y_prediction = predict(regressor, newdata = testing_set)
summary(regressor)

# Multiple regression after Backward elimination
regressor1 = lm(formula = charges ~ age + bmi + children+smoker,
                data = training_set)
summary(regressor1)

y1_prediction = predict(regressor1, newdata = testing_set)