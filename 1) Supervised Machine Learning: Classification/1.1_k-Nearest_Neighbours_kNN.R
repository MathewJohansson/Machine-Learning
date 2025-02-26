
# "Learn by example". 
#   Introducing classification while working through the application of kNN. 

# Classification = when a concept to be learned is a set of categories. 

# Grouping via similarities/distances. 
# A nearest neighbour learner imagines the properties of objects as coordinates in a feature space.

# Euclidean distance formula.



# R's knn() searches a dataset for the historic observation most similar to
#    the newly observed one. 

library(class)
pred <- knn(training_data, testing_data, training_labels)


# In kNN, k = a variable that specifies the no. of neighbours to consider when
#    making the classification. 

# Default of k = 1, meaning that only the single nearest, most-similar neighbour
#    was used to classify the unlabelled example. 

# ^ k = ^ no. of observations/nearest neighbours that the machine checks and 
#    then votes on. Highest vote = machine decision. 

# But bigger k is not always better: 
#    A larger k can set a line that is generalistic but misses some interesting noise. 
#    No universal rule for setting k. 
#    A good approach: test several different values of k and compare the performance 
#        on unseen data. 


#    E.g., an ML model that compares a stop sign to the 15 nearest neighbours: 

k_15 <- knn(train = signs[,-1], test = signs_test[,-1], cl = sign_types, k = 15)

# train = training dataset.
# test = testing dataset. 
# cl = classification. 
# [,-1] = all but last col. to remove label col. 

# In the attr(), (..., prob) obtains vote proportions for the predicted class.
#   - Need to fit prob = TRUE into the knn().

# This allows us to examine the neighbours votes to better understand which 
#     predictions are closer to unanimous. 



# Preparing data for nearest neighbours:

# Dummy Coding: 
#   Using 1/0 indicators to represent non-numerical categories, such as shapes. 

# Binary 'dummy' variable, 1 if true. 

# Note: when calculating distance, each feature of the input data should be measured 
#    with the same range of values (e.g., colour hexes).

# Rescaling allows for corrections in ranges. 
# Feature Scaling = a method to normalise the range of independent variables or
#    features of data. 


# Normalise Data in R: 

# a min-max normalise () function:
normalise <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

# Above rescales vector x so min = 0, max = 1 

summary(normalise(signs$r1))

# Above are summary stats for the normalised data. 












