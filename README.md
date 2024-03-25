# Machine-learing-Lab-1
Student Performance Prediction
Overview
This repository contains code for a predictive model to determine student pass/fail outcomes based on factors such as disability status and Index of Multiple Deprivation (IMD) band. The model utilizes logistic regression and is implemented using the tidyverse and tidymodels packages in R.

Data
The dataset used for this analysis is stored in "studentInfo.csv". It includes information on students' demographics, disabilities, IMD band, and final result (pass/fail).

Workflow
Data Preprocessing: The data is loaded and preprocessed, including feature engineering to convert variables into appropriate formats.

Model Training: The data is split into training and testing sets. A logistic regression model is trained using the training data.

Model Evaluation: The trained model is evaluated using the testing data to assess its predictive performance.

Setup
Before running the code, ensure you have the following R packages installed:

tidyverse
tidymodels
janitor
Make sure to set the working directory to the location of your dataset and R script.

Usage
Clone Repository: Clone this repository to your local machine.

Install Dependencies: Install the required R packages mentioned above.

Run Script: Execute the R script provided (student_performance_prediction.R) in your R environment.

Results
The final fitted model's performance metrics, including accuracy, are displayed in the output. Additionally, predictions on the testing data are collected and analyzed to assess the model's accuracy.

Contributors
[Your Name](link to your GitHub profile)
