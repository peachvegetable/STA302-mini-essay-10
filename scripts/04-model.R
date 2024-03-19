#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
neg_binomial_model <-
  stan_glm(
    math_score ~ gender + parental_level_of_education + test_preparation_course,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  neg_binomial_model,
  file = "models/neg_binomial_model.rds"
)

