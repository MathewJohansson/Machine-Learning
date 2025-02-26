
# Train and Evaluate Regression Models. 

# Evaluate a model graphically. 
# - How well does the model/do the predictions fit the data? 

# Models that don't fit well have systematic errors: 
#    They aren't correlated with actual outcome. 


# Residual = actual outcome - predictions. 
# Good fit = no systematic errors. 

# Systematic errors = clusters of residuals. 

df$residuals <- df$outcome - df$predictions




# Gain Curve: 

#   Useful when sorting instances is more important than predicting exact outcome value. 

# Wizard curve: perfect model.
# Blue curve: what our model traces out. 

GainCurvePlot(houseprices, "prediction", "price", "Home Price Model")
#            (dataframe, names of prediction + outcome cols, title)




# Root Mean Squared Error (RMSE): 

#    .............
# \./ (y - pred)²

# y - pred = error / residuals vector 
# root/(y - pred)² = mean value of (y - pred)² 

# RMSE = "Typical" prediction error of the model on that data. 

# RMSE of home sales price model: 
# Calculate error: 
err <- houseprices$predictions - houseprices$price 

# Square error vector:
err2 <- err^2

# Take mean, sqrt it:
(rmse <- sqrt(mean(err^2)))

# Standard deviation of the outcome: 
(sdtemp <- sd(houseprices$price)) 




# R-Squared R² 

# Measure for how well the model fits or explains the data. 
# Value between 0-1
# Near 1 = model fits well.
# Near 0 = no better than guessing the average value. 

# R² is the variance explained by the model. 

#            RSS
# R² = 1 - -------
#           SSTot

# RSS = sum(y - predictions)²   
#       Residual sum of squares (variance from model).
# SSTot = sum(y - y''')² 
#         Total sum of squares (variance of data). 



# Calculate R² of the House Price Model: RSS

# Calculate error: 
err <- houseprices$prediction - houseprices$price

# Square it and take the sum:
rss <- sum(err^2) 

# - price: column of actual sale prices
# - pred: column of predicted sale prices (in thousands). 
# - RSS ~~ 136138

# Take the differences of prices from the mean price
toterr <- houseprices$price - mean(houseprices$price) 

# Square it and take the sum: 
sstot <- sum(toterr^2)

# - RSS ~~ 136138
# - SSTot ~~ 713615 

# Finally, take the ratio of the residual sum of squares to the total sum of 
#    squares and subtract it from 1 
(r_squared <- 1 - (rss/sstot) )



# For lm() models, you can read the R² here: 

# From summary():
summary(hmodel) 
summary(hmodel)$r.squared

# From glance():
glance(hmodel)$r.squared 




# Correlation and R²:

# For models that minimise squared error (like Linear Regression), the 
#    R² is the square of the correlation between the outcome and the prediction.

# This states intuitively what we want to be true of a model:
#    That the predictions and outcome are correlated. 

# True for models that minimise squared error:
# - Linear Regression.
# - GAM Regression.
# - Tree-based algorithms that minimise squared error. 

# True for training data; NOT true for future application data. 


rho <- cor(houseprices$prediction, houseprices$price) 
rho^2 

# p = cor(prediction, price) 
# p² = R² 




# Back to the Home Sales Price Model, continuing with R²:

# unemployment is available
summary(unemployment)

# unemployment_model is available
summary(unemployment_model)

# Calculate and print the mean female_unemployment: fe_mean
(fe_mean <- mean(unemployment$female_unemployment))

# Calculate and print the total sum of squares: tss
(tss <- sum((unemployment$female_unemployment - fe_mean)^2))

# Calculate and print residual sum of squares: rss
(rss <- sum(unemployment$residuals^2))

# Calculate and print the R-squared: rsq
(rsq <- 1 - (rss/tss))

# Get R-squared from glance and print it
(rsq_glance <- glance(unemployment_model)$r.squared)



# And with the Correlation and R²:

# Get the correlation between the prediction and true outcome: rho and print it
(rho <- cor(unemployment$predictions, unemployment$female_unemployment))

# Square rho: rho2 and print it
(rho2 <- rho^2)

# Get R-squared from glance and print it
(rsq_glance <- glance(unemployment_model)$r.squared)





# Properly Training a Model:

# In general, a model performs better on its training data than data it 
#    hasn't yet seen. 

# Complex models can produce misleading results. 


# Cross-Validation:
# When there is not enough data to split into training and test sets, 
#    cross-validation estimates a model's out-of-sample performance. 

# n-fold cross-validation: partition data into n-subsets. 

# Cross-Validation Plan:

library(vtreat) 
splitPlan <- kWayCRossValidation(nRows, nSplits, NULL, NULL)

# - nRows: no. of rows in the training data
# - nSplits: no. of folds/partitions in the cross-validation.
#            e.g., nfolds = 3 for 3-way cross-validation.
# - Remaining 2 arguments not needed here. 


# E.g.;

library(vtreat)
splitPlan <- kWayCrossValidation(10, 3, NULL, NULL)

# First fold (A and B training sets to train, C training set to test) 
splitPlan[[1]]

# Train on A and B, test on C, etc...
split <- splitPlan[[1]]
model <- lm(fmla, 
            data = df[split$train, ])
df$pred.cv[split$app] <- predict(model, newdata = df[split$app, ])

















