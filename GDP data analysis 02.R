library(tidyverse)
library(janitor)


"final_statewise_gsdp.csv" %>% 
  read_csv() -> statewise_gsdp

statewise_gsdp %>%
  pull(item) %>% 
  unique()



#1. for every financial yr, which sector has performed well
#2. for every financial yr, which sector has performed least
#3. for every financial yr, which state has performed well
#4. for every financial yr, which state has performed least
#5. top 5 performing state in manufacturing
#6. top 5 performing state in construction
#7. for every financial 2016-2017 , for every state get top performing sector
#8. for every financial 2016-2017 , for every state get top 5 performing sector
#9. how many states are performing well in manufacturing, (if manufacturing is in top 3)
#10. what is the GROSS GSDP of Karnataka for all financial years  