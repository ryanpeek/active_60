source("R/drake/packages.R")
source("R/drake/functions.R")
source("R/drake/plan.R")
# options(clustermq.scheduler = "multicore") # optional parallel computing
drake_config(my_plan, verbose = 2)
