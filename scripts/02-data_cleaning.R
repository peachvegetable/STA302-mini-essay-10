#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(gender, parental_level_of_education, test_preparation_course, math_score) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
