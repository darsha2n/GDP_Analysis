library(tidyverse)
library(janitor)


"final_statementwise_gsdp.csv" %>% 
  read.csv() -> statewise_gsdp

statewise_gsdp %>%
  pull(item) %>% 
  unique()
  
