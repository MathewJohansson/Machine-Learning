
# Logistic Regression: 

# Regression Analysis = using stats to model numeric rels w/in data. 

# Predict outcome (y) w/ one or more predictors (x variables). 
# y = dependent var., depends on x's. 

# Linear regression - line of best fit bw- x and y. 

# For y being binary (0 or 1 ), an S-curve is great. 
# Logistic regression. 
# y is always between 0 and 1 (probability). 



# Making predictions w/ logistic regression: 

m <- glm(y ~x1 + x2 + x3, 
         data = my_dataset,
         family = "binomial") # type of glm 

prob <- predict(m, test_dataset, type = "response") 
pred <- ifelse(prob > 0.50, 1, 0)
# > 0.50 = 1 
# < 0.50 = 0 
# for prob prediction. 



# ROC Curves: 
# To better understand a models' ability to distinguish bw- pos and neg predictions; 
# the outcome of interest vs. all others.

# - Comparing positive outcomes (y) against other outcomes (x). 
# - Areas under curve as measure (AUC). 
#   Perfect model = 1, middle = 0.50 
# - Different shapes can have same AUC. 



# Dummy coding categorical data: 

# Create gender factor: 
my_data$gender <- factor(my_data$gender,
                         levels = c("Male", "Female", "Other"))

# Missing vales can be excluded, or predicted (mean imputation). 


# Interaction effects = when combining 2 factors, this may have a different 
# outcome than the sum of their separate individual impacts. 

# Interaction of obesity and smoking: 
glm(disease ~ obesity + smoking, 
    data = health,
    family = "binomial")



# Handling missing data:

# Find average age among non-missing values:
summary(donors$age) 

# Impute missing age values w/ mean age:
donors$imputed_age <- ifelse(is.na(donors$age),
                             round(mean(donors$age, na.rm = TRUE), 
                                   2), donors$age) 

# Create missing value indicator for age: 
donors$missing_age <- ifelse(is.na(donors$age), 1, 0) 

# For imputed_age (missing values), find missing values, set them to 2d.p. age average, 
# and have no non-missing values in imputed_age 



# Sophisticated Regression Model: 

# - RFM model about donation data. 

# Build a recency, frequency, and money (RFM) model: 
rfm_model <- glm(donated ~ recency * frequency + money, 
                 data  = donors, 
                 family = "binomial") 

# Summarise model to see how parameters are coded: 
summary(rfm_model)

# Compute predicted probabilities of RFM model: 
rfm_prob <- predict(rfm_model, type = "response") 

# Plot ROC curve, find AUC: 
library(pROC) 
ROC <- roc(donors$donated, rfm_prob) 
plot(ROC, col = "red") 
auc(ROC) 



# Automatic Feature Selection: 

# Stepwise regression is used to find the best combinaton of predictors to 
# produce the best predictions. 

# Backward + forward stepwise. 












