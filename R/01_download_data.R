
# Get Data ----------------------------------------------------------------

#library(googlesheets4)
#library(tidyverse)
#library(tidylog)
#library(janitor)
#library(here)

# spreadsheet: https://docs.google.com/spreadsheets/d/1xY8a-8xwcfLiKw03UjJwDVzYfX3E55AHYUb_gY9L3ys/edit#gid=0

# form:
# https://forms.gle/gaHpwhjUXDfRGZr17

# Authorize ---------------------------------------------------------------

# auth
options(gargle_oauth_cache = here::here(".secrets")) 

# auth for sheets
gs4_auth(email = "ryan.a.peek@gmail.com", cache = here::here(".secrets"))


# Read in Sheet -----------------------------------------------------------

# read in sheet:
wb <- gs4_get(ss = "1xY8a-8xwcfLiKw03UjJwDVzYfX3E55AHYUb_gY9L3ys")

# clean
data_clean <- read_sheet(wb, sheet = 1) %>% 
  clean_names(., "big_camel")
  
# save 
write_rds(data_clean, path = paste0("data/",Sys.Date(),"_active60_data.rds"))
