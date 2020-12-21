# The workflow plan data frame outlines what you are going to do.

my_plan <- drake_plan(
  start_date = as_datetime(Sys.Date()),
  get_data = load_data(),
  make_tidy = do_tidy(get_data),
  make_visualize = do_visualize(make_tidy),
  report = rmarkdown::render(
    knitr_in("report_demo.Rmd"),
    output_file = file_out("report_demo.html"),
    quiet = TRUE)
)
