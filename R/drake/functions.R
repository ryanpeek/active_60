# drake::clean(destroy = TRUE) # destroy = TRUE removes the .drake/ folder too.
# unlink(c("report.html", "output", "*.png", "*.pdf"), recursive = TRUE)


# Convert the scripts into functions via `code_to_function()`
load_data <- code_to_function("R/01_download_data.R")
do_tidy <- code_to_function("R/02_tidy_data.R")
do_visualize <- code_to_function("R/03_visualize.R")

