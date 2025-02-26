
# Regression: Predict a numerical outcome (dependent variable) from a set 
#             of inputs (independent variable). 

# - Statistical sense - predict the expected value of the outcome. 
# - Casual sense - predict a numerical outcome, rather than a discrete one. 

# Scientific mindset = Modelling to understand the data generation process.

# Engineering mindset = Modelling to predict accurately. 



# Linear Regression: 

# y = B0 + B1x1 + B2x2 + ...
# y is linearly related to each xi
# Each xi contributes additively to y. 

cmodel <- lm(temperature ~ chirps_per_sec,
             data = cricket) 

# String into formula: 
fmla_1 <- as.formula("temperature ~ chirps_per_sec") 

# Model diagnostics:
summary(model) 

# Package into dataframe: 
broom::glance(cmodel) 

# R2 diagnostic: 
sigr::wrapFTest(cmodel) 



# Predicting and Plotting: 

cricket$prediction <- predict(cmodel)
ggplot(cricket, aes(x = prediction, y = temperature)) + 
  geom_point() + 
  geom_abline(colour = "darkblue") + 
  ggtitle("...") 

# Applying model to new data: 

newchirps <- data.frame(chirps_per_sec = 16.5)
newchirps$prediction <- predict(cmodel, 
                                newdata = newchirps)
newchirps 



# Pro's and Con's of Linear Regression: 

# Pros:
# - Easy to fit and apply.
# - Concise (don't need much storage). 
# - Less prone to overfitting. 
# - Interpretable. 

# Cons: 
# - Can only express linear an additive relationships. 



# Collinearity: 

# - When variables are partially correlated. 
# - Coefficients might change sign. 
# - High collinearity: 
#   - Coefficients (or standard errors) look too large. 
#   - Model may be unstable. 











