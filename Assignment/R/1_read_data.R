

# For large datasets, we'll use data.table:

if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}


library(tidyverse)

# 1. Read and edit ----

old <- readRDS("../Data/prof_SWE_edited.RDS")

new <- 
  old %>% 
  select(
    profileid, father, mother, gender, is_alive
    , ends_with("year")
    , ends_with("month")
    )

fwrite(new, "../Data/sweden_genealogy.csv", row.names = F)

rm("old")
rm("new")

# 2. Read formatted data ----

# Load using data table:
prof <- data.table::fread("../Data/sweden_genealogy.csv", stringsAsFactors = F) %>% 
  # but transform to data.frame since data.table objects obey different rules in R:
  data.frame

glimpse(prof)
