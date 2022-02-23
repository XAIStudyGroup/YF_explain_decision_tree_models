rm(list = ls())
library(ggplot2)
library(rpart)
library(rpart.plot) # you need to install two packages

# use data from 
# https://github.com/christophM/interpretable-ml-book/blob/master/data/bike.RData
load("data/bike.RData")

str(bike)
summary(bike)

# make a visualization
ggplot(data=bike) +
  geom_point(mapping=aes(x=days_since_2011, y=cnt)) +
  geom_line(mapping = aes(x=days_since_2011, y=cnt))

# create a training dataset, only leave three points out
bike_train <- bike[-c(100, 400, 600),]
bike_test <- bike[c(100, 400, 600),]

fit <- rpart(cnt ~ days_since_2011 + temp, data=bike_train, 
             control = rpart.control(maxdepth = 2)) # fit the model

rpart.plot::rpart.plot(fit) # make visualization

summary(fit) # examine variable importance

# find predictions
bike_predict <- rpart.predict(fit, bike_test)

# data point 100: 1787.562
bike[100, 'temp'] # 12.05335
bike[100, 'days_since_2011'] # 99

# data point 400: 
bike[400, 'temp'] # 4.415849
bike[400, 'days_since_2011'] # 399

# data point 600:
bike[600, 'temp'] # 23.3725
bike[600, 'days_since_2011'] # 599
