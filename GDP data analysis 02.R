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




library(tidyverse)
library(janitor)

"final_statewise_gsdp.csv" %>% 
  read_csv() %>% 
  rename("sector"= "item")->statewise_gsdp

statewise_gsdp %>% 
  pull(sector) %>% 
  unique()

# 1.for every financial year , which sector has performed well

statewise_gsdp %>% 
  group_by(year,sector) %>% 
  summarise(total_gsdp=sum(gsdp,na.rm=T))->df

df %>% 
  group_by(year) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1)

# 2.for every financial year , which sector has performed least

statewise_gsdp %>% 
  group_by(year,sector) %>% 
  summarise(total_gsdp=sum(gsdp,na.rm=T))->df

df %>% 
  group_by(year) %>% 
  arrange((total_gsdp)) %>% 
  slice(1)

# 3.for every financial year , which state has performed well

statewise_gsdp %>% 
  group_by(year,state) %>% 
  summarise(total_gsdp=sum(gsdp,na.rm=T))->df

df %>% 
  group_by(year) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1)



# 4.for every financial year , which state has performed least

statewise_gsdp %>% 
  group_by(year,state) %>% 
  summarise(total_gsdp=sum(gsdp,na.rm=T))->df

df %>% 
  group_by(year) %>% 
  arrange((total_gsdp)) %>% 
  slice(1)

# 5.top 5 performing states in manufacturing 
statewise_gsdp %>% 
  filter(sector=="Manufacturing") %>% 
  group_by(state) %>%
  summarise(total_gsdp = sum(gsdp, na.rm = TRUE), .groups = "drop") %>% 
  arrange(desc(total_gsdp)) %>%
  slice(1:5)


# 6.top 5 performing states in construction

statewise_gsdp %>% 
  filter(sector=="Construction") %>% 
  group_by(state) %>%
  summarise(total_gsdp = sum(gsdp, na.rm = TRUE), .groups = "drop") %>% 
  arrange(desc(total_gsdp)) %>%
  slice(1:5)

# 7.for financial year 2016-17,for every state get top performing sector

statewise_gsdp %>% 
  filter(year==2016-17) %>% 
  group_by(state,sector) %>% 
  summarise(total_gsdp= sum(gsdp, na.rm = TRUE)) %>% 
  
  
  
  
# 8.for every financial 2016-2017 , for every state get top 5 performing sector
statewise_gsdp %>% 
  filter(year=="2016-17") %>% 
  group_by(state,sector) %>% 
  summarise(total_gsdp=sum(gsdp,na.rm=T)) ->df

df %>% 
  group_by(state) %>% 
  arrange(desc(total_gsdp)) %>% 
  slice(1:5)



# 9.how many states are performing well in manufacturing, (if manufacturing is in top 3)

statewise_gsdp %>% 
  group_by(state,sector) %>%
  summarise(total_gsdp = sum(gsdp, na.rm = TRUE), .groups = "drop") %>% 
  group_by(state) %>%
  arrange(desc(total_gsdp)) %>%
  slice(1:3) %>% 
  filter(sector=="Manufacturing") -> top_manufacturing_states
nrow(top_manufacturing_states)


# 10.what is the GROSS GSDP of Karnataka for all financial years
statewise_gsdp %>% 
  filter(state=="Karnataka") %>% 
  group_by(year) %>% 
  summarise(total_gsdp = sum(gsdp, na.rm=T)) ->karunadu

print(karunadu)
