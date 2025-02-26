
# Classification Trees: 
# Making decisions with trees. Trees use historical data to make decisions. 

# Decision nodes = proposed decisions. 
# Leaf nodes = decisions. 

# Divide-and-conquer: Process that divides dataset into partitions with similar
# values for the outcome of interest. 

# Simple rpart classification tree:
library(rpart) 
m <- rpart(outcome ~ loan_amount + credit_score,
           data = loans, 
           method = "class")

#rpart.plot() to plot model. 


# Building and Evaluating a Larger Tree: 
# - Previously created was a simple decision tree that used credit score and 
#   requested loan amount to predict loan outcome. 
# - Loans data split into training and testing data (75/25). 

# Grow a tree using all available applicant data: 
loan_added <- rpart(outcome ~ .,
                    data = loans_train,
                    method = "class", 
                    control = rpart.control(cp = 0)) 

# Make predictions on test dataset:
loans_test$pred <- predict(loan_model, loans_test, type = "class") 

# Examine confusion matrix: 
table(loans_test$pred, loans_test$outcome) 

# Compute accuracy on the test dataset: 
mean(loans_test$pred == loans_test$outcome) 



# Quick Recap: 

# - Divide-and-conquer = split data into purest possible parts. 
# - Axis-Parallel Splits = decision trees can only make splits on single features at a time.
# - Overfitting = when a tree becomes too complex, modelling noise instead of underlying
#   data trends. 
# - Creating random test datasets: 
sample_rows <- sample(nrow(loans), nrow(loans) * 0.75)
loans_train <- loans[sample_rows, ]
loans_test <- loans[-sample_rows, ]

# - Build and evaluate  larger trees = rpart() to grow tree. 
#                                      predict() to make predictions. 
# - Fair Performance Evaluations = how well did the tree perform? 




# Tending to/Pruning Classification Trees:

# Pre-pruning: e.g., max depth level = 3 levels.
#              e.g., min 10 observations to split. 

# Post-pruning: Nodes an branches with only minor impacts on the trees are pruned. 
#               Retains accuracy. Increases in complexity; reductions in error rate. 


# Pre-pruning with rpart(): 
library(rpart) 
prune_control <- rpart.control(maxdepth = 30, 
                               minsplit = 20) 

m <- rpart(repaid ~ credit_score + request_amt,
           data = loans, 
           method = "class",
           control = prune_control)


# Post-pruning with rpart(): 
m <- rpart(repaid ~ credit_score + request_amt,
           data = loans, 
           method = "class")

plotcp(m)

m_pruned <- prune(m, cp = 0.20) 


# Tree with max depth of 6: 

loan_model <- rpart(outcome ~ ., 
                    data = loans_train,
                    method = "class",
                    control= rpart.control,
                    cp = 0,
                    maxdepth = 6) 

# Class prediction on test set:
loans_test$pred <- predict(loan_model, loans_test, type = "class") 

# Compute accuracy: 
mean(loans_test$pred == loans_test$outcome) 

# An overly complex tree has control = rpart.control(cp = 0) and no maxdepth or minsplit. 



# Random Forests:

# Specific growing algorithm where both features and examples may differ from tree to tree.

# Ensemble = combine different trees, teamwork. 
#            group predictions as majority vote. 

library(randomForest) 
m <- randomForest(repaid ~ credit_score + request_amt,
                  data = loans, 
                  ntree = 500,      # no. of trees in forest
                  ntry = sqrt(p))   # no. of predictions (p) per tree. 

# Making predictions from a random forest:
p <- predict(m, test_data)














