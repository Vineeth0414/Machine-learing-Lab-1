# Load tidyverse package
library(tidyverse)

# Load tidymodels package
library(tidymodels)

# Load janitor package
library(janitor)

# Read in the data
student_data <- read_csv("studentInfo.csv")

# Mutate variables
student_data <- student_data %>%
  mutate(pass_status = ifelse(final_result == "Pass", 1, 0)) %>%
  mutate(pass_status = as.factor(pass_status))

student_data <- student_data %>%
  mutate(disability_status = as.factor(disability))

# Examine the data
student_data

# Feature engineering
student_data <- student_data %>%
  mutate(imd_band = factor(imd_band, levels = c("0-10%", "10-20%", "20-30%", "30-40%", "40-50%", "50-60%", "60-70%", "70-80%", "80-90%", "90-100%"))) %>%
  mutate(imd_band_numeric = as.integer(imd_band))

# Split data
set.seed(20230712)
train_test_split <- initial_split(student_data, prop = 0.80)
train_data <- training(train_test_split)
test_data <- testing(train_test_split)

# Create a recipe
student_recipe <- recipe(pass_status ~ disability_status + imd_band_numeric, data = train_data)

# Specify the model
logistic_model <- 
  logistic_reg() %>% 
  set_engine("glm") %>% 
  set_mode("classification")

# Add model and recipe to workflow
student_workflow <- 
  workflow() %>% 
  add_model(logistic_model) %>% 
  add_recipe(student_recipe)

# Fit model
fitted_student_model <- fit(student_workflow, data = train_data)

# Create a resampling object for the testing data
test_split <- rsample::initial_split(test_data, prop = 0.8)

# Fit the model using the testing data
final_fit <- last_fit(student_workflow, split = test_split)

# View the final fitted model
final_fit

# Collect predictions
final_fit %>%
  collect_predictions()

# Interpret accuracy
final_fit %>%
  collect_predictions() %>%
  select(.pred_class, pass_status) %>%
  mutate(correct_prediction = .pred_class == pass_status) %>%
  tabyl(correct_prediction)

# Wrap up and knit the document
