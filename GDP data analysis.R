library(tidyverse)
library(janitor)
library(stringr)



dir(path = "GDP Data")

setwd("E:/Session 1 rstudio assignment/session 1 r studio M.DARSHAN/GDP_Analysis")
read_csv("GDP Data/NAD-Andhra-Pradesh-GSVA_cur_2016-17.csv") -> op_df


dir(path = "GDP Data")

"GDP Data/NAD-Andhra-Pradesh-GSVA_cur_2016-17.csv" %>% read_csv() -> op_df

op_df %>% 
  filter()

op_df %>% 
  slice(-c(7,11,27,33)) %>% 
  pivot_longer(-c(1,2),names_to ="year",values_to ="gsdp") %>% 
  clean_names() %>% 
  select(-1) %>% 
  mutate(state=St_name)

