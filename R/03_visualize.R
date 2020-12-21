
# Visualize data ----------------------------------------------------------


# libraries
#library(tidyverse)
#library(ggthemes)
#library(hrbrthemes)
#library(cowplot)

# Get Data ----------------------------------------------------------------

# load data
clean_data <- read_rds("output/clean_data_active_60.rds")

# days for labeling
wday_names <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

# Line Plot of Strength ---------------------------------------------------

pushups <- ggplot(data=clean_data %>% filter(activity=="Pushups")) + 
  geom_line(aes(x=as.integer(days), y=amount, color=person), size=1) +
  geom_point(aes(x=as.integer(days), y=amount, fill=person), size=4.5, pch=21) +
  #theme_classic(base_family = "Roboto Condensed")+
  theme_ipsum_rc() +
  scale_color_colorblind("Person") +
  scale_fill_colorblind("Person") +
  ylim(c(0,50)) +
  scale_x_continuous(breaks=c(1:7), labels=wday_names) +
  labs(x="", y="Amount", title="Pushups") + 
  facet_grid(week~.)
pushups

situps <- ggplot(data=clean_data %>% filter(activity=="Situps")) + 
  geom_line(aes(x=as.integer(days), y=amount, color=person), size=1) +
  geom_point(aes(x=as.integer(days), y=amount, fill=person), size=4.5, pch=21) +
  theme_ipsum_rc() +
  scale_color_colorblind("Person") +
  scale_fill_colorblind("Person") +
  ylim(c(0,50)) +
  scale_x_continuous(breaks=c(1:7), labels=wday_names) +
  labs(x="", y="Amount", title="Situps") +
  facet_grid(week~.)
situps

# cowplot

plot_grid(situps, pushups, ncol=1)

if(!fs::dir_exists("figures")){
  fs::dir_create("figures")
}

save_plot(plot_grid(situps, pushups, ncol=1), filename = "figures/situps_pushups.png", base_width = 7, base_height = 6, dpi=300)
