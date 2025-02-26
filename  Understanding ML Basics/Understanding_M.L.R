
# DataCamp: Understanding M.L.

# ML - A set of tools for making inferences and predictions from data. 


# - Predict future events.
# - Infer causes of events. 
# - Infer patterns. 

# Learns patterns from existing data and applies it to new data. 

# ML Model: Statistical representation of a real-world process based on data. 

# New input --> Model --> Outcome. 



# 3 Types:
# 1. Reinforcement learning. 
# 2. Supervised learning. 
# 3. Unsupervised learning. 

# 1. Reinforcement = sequential actions. 
#    I.e., a robot deciding its path. 
#    Not as common. 

# 2. Supervised = labelled input and output training data. 

# 3. Unsupervised = unlabelled. 


# Training data = existing data to learn from. 
# Training a model = model being built from training data. 

# When looking at a target variable, the values for that variable column have labels if it's supervised. 

# Unsupervised is useful for anomaly detection and clustering. 
# With unsupervised, labels are unknown - it finds its own labels. 



# Workflow: 

# 1. Extract features. 
# 2. Split dataset. 
# 3. Train model. 
# 4. Evaluate. 

# - Train the model on the desired dataset, then test the model using test dataset.
# - Test dataset is unused % of the original dataset that was split prior to training model.

# Test dataset --> Model --> Evaluate prediction. 

# Q. Is the performance good enough? 

# Tune + retrain: change the models' options, add/remove features. 




# Supervised learning: 

# 1. Classification. 
# 2. Regression. 



# 1. Classification: 
#    Assigning a category. 
#    The model is fed observations. 

# Support Vector Machine: 
#    Divides a graph. separating points. 
#    These lines can be curved. 



# 2. Regression: 
#    Assigns a continuous variable. 

# We want the differences between the actual and predicted values. 

# Error = distance bw- point (actual value) and line (predicted value). Residuals. 

# Many ways to calculate, e.g., Root Mean Square Error. 




# Unsupervised: 

#    No target columns. 
#    No guidance. 
#    Looks at the whole dataset. 
#    Tries to detect patterns. 


# 1. Clustering. 
# 2. Anomaly detection. 
# 3. Association. 


# 1. Clustering: 

#    Identifies groups in the dataset (e.g., similarities). 
#    We need to investigate the produced clusters. 

# Clustering models: 
#    - KMeans: Specify number of clusters. 
#    - DBSCAN: Density-Based Spatial Clustering of Applications w/ Noise) - specify what is a cluster. 


# 2. Anomaly Detection: 

#    Detects outliers. 
#    Points that differ from all others. 
#    Outliers in 3D graphs can be difficult to spot. 


# 3. Association:

#    Finding relationships bw- observations. 




# Evaluating Data: 

# Overfitting: 

#   - Performs great on training data. 
#   - Performs poor on testing data. 
#   - Model memorised training data and can't generalise learning to new data. 
#   - Use testing set to check model performance. 

# Overfitting can be too precise and can miss valid datapoints. 


# Confusion Matrix: 

# Used to measure accuracy of a model. 

#             |    Positive    |    Negative
# ----------------------------------------------
# Positive    |    True Pos    |    False Neg
# ----------------------------------------------
# Negative    |    False Pos   |    True Neg   


# Similarity measure = % of datapoints classified correctly. 
# Values true positives. 

#              True positives
# = -----------------------------------
#     True positives + false negatives


# Specificity values true negatives:

#              True negatives
# = -----------------------------------
#     True negatives + false positives




# Improving Performance: 

# Several options, this course focuses on: 
# - Dimensionality reduction. 
# - Hyperparameter tuning. 
# - Ensemble methods. 


# 1. Dimensionality reduction: 

# Dimensions = no. of features in data. 
# - We want to decrease the number of features, else it can be too complex. 
# - Some features aren't useful info.
# - Some features carry similar info, so some can be dropped. 
# - Similar features can be collapsed into one underlying feature. 


# 2. Hyperparameter tuning: 

# . Allows for precise, detailed tuning of model parameters. 


# 3. Ensemble methods:

# - Combines models. 
# - Can create average of combined model results. 




# Deep Learning: 

# Aka: neural networks. 
# - Basic unit: neurons/nodes. 
# - Area of ML. 
# - Requires more data. 
# Best when inputs are images or text. 

# The job of a neural network is to map relationships bw- different combinations
#    of variables to the desired output. 

# A neural net figures out middle neurons, by testing and analysing relationships
#    bw- the neurons. 

# - Neural networks are huge. 
# - Deep learning = neural network w/ many neurons. 
# - Can solve complex problems. 


# When to use Deep Learning? 

# - Lots of data. 
# - Access to processing power. 
# - Lack of domain knowledge. 
# - Complex problems, e.g., computer vision, natural language processing. 

#   Computer vision: helps computers to see + understand the context of digital images. 
#   NLP: Computers understanding the meaning of human language. 
#        - Bag-of-words = word + sequence counts. 















