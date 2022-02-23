rm(list = ls())
library(rpart)
library(rpart.plot)
library(caret)

library(datasets)
data(iris)
summary(iris)

iris_train <- iris[-c(25, 75, 125)]
iris_test <- iris[c(25, 75, 125), -c(5)]

fit <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
             data = iris_train)

rpart.plot::rpart.plot(fit)

iris_predict <- rpart.predict(object = fit, newdata = iris_test)

# datapoint 1: predict: setosa
iris[25,'Petal.Length'] # 1.9 -> setosa
iris[25, 'Petal.Width'] # 0.2
iris[25, 'Species'] # setosa

# datapoint 2: predict: versicolar
iris[75, 'Petal.Length'] # 4.3
iris[75, 'Petal.Width'] # 1.3
iris[75, 'Species'] # versicolor

# datapoint 3: predict virginica
iris[125, 'Petal.Length'] # 5.7
iris[125, 'Petal.Width'] # 2.1
iris[125, 'Species'] # virginica
