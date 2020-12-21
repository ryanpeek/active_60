# Tidy Data ----------------------------------------------------------------

#library(tidyverse)
#library(lubridate)
#library(janitor)
#glue


# Get Most Recent Data ----------------------------------------------------------------

# list the files
(files <- list.files(path = "data/", pattern = "*.rds") %>% 
  as_tibble)

# separate and get most recent version:
files %>% 
  separate(.,col = "value", sep = "_", into = "dates") %>%
  mutate(dates = ymd(dates)) %>%
  arrange(desc(dates)) %>% slice(1) -> uptodate

# most recent date updated
uptodate$dates

# read in correct data file
workouts <- read_rds(glue("data/{uptodate$dates}_active60_data.rds")) %>% 
  # fix date to just date
  mutate(StartDate = as.Date(StartDate))

# Now Pivot and Tidy to Long format ---------------------------------------

#workouts

wo_long <- pivot_longer(workouts,cols = c("Monday":"Sunday"), names_to = "days", values_to = "amount") %>% 
  # convert to factor for plotting
  mutate(days = factor(days, levels = weekdays(Sys.Date() + 1:7))) %>% 
  clean_names()

#wo_long

# Save --------------------------------------------------------------------

write_rds(wo_long, path = "output/clean_data_active_60.rds")
