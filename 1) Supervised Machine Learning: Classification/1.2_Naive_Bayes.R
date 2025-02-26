
# Understanding Bayesian Methods. 

#                                  no. of times the event happened 
# Probability of an event = --------------------------------------------
#                            no. of times the event could have happened

# Joint Probability of two events is found by finding the proportions of observations
#    they occurred together. 
#   P(A and B)

# Independent Events = when two events don't influence each other. 

# Conditional Probability = how one event depends on another. 


# P(A|B) = P(A and B) / P(B) 
# Probability of event A, given B, is equal to their joint probability divided by 
#     the probability of B. 


# "Naive Bayes" algorithm applies Bayesian methods to estimate the conditional 
#    probability of an outcome. 

library(naivebayes)
m <- naive_bayes(location ~ time_of_day,
                 data = location_history)
# essentially: naive_bayes(formula, data)



# Making Predictions:
future_location <- predict(m, future_conditions) 

# E.g., where 9am dataset = location at 9am each day. 
# "location" = location (e.g., "office")
# "daytype" = weekend or weekday. 

# P(A): 
p_A <- nrow(subset(where9am, location == "office")) / nrow(where9am)

# P(B):
p_B <- nrow(subset(where9am, dayptype == "weekday")) / nrow(where9am)

# P(A and B): 
p_AB <- nrow(subset(where9am, location == "office" & daytype == "weekday")) / nrow(where9am) 

# P(A|B) = P(A and B) / P(B)


# Predicting Locations: 

library(naivebayes)
locmodel <- naive_bayes(location~daytype, data = where9am)
predict(locmodel, thursday9am) 

# locmodel builds a prediction model using location as a function of daytype (y ~ x)
# where9am is the dataset. 
# predict() runs locmodel predicting to predict location on Thursday at 9am. 

# Within predict() you can also add: 
#   , ... type = "prob") for probability. 
# Type can be set differently. 


# Laplace correction/estimator: 
#   When an ML model looks at data and assumes a 0% probability of an event happening 
#   because it hasn't happened before, +1 is added because it could happen in the future,
#   realistically it just hasn't happened yet. 
# (= 0.01)

# naive_bayes() will let you set this. 



# Applying Laplace Correction:

## Observe predicted probabilities for a weekend afternoon: 
predict(locmodel, weekend_afternoon, type = "prob") 

# Build a new model w/ Laplace:
locmodel2 <- naive_bayes(location ~ daytype + hourtype, data = locations, laplace = 1) 

# Observe new predicted probabilities for a weekend afternoon: 
predict(locmodel2, weekend_afternoon, type = "prob") 

# Binning = putting data values into categories (e.g., value ranges into 
#    temperature categories). 






