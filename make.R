
# LOAD SOURCE FILES -------------------------------------------------------

source("R/drake/packages.R")  # Load all the packages you need.
source("R/drake/functions.R") # convert the scripts to functions
source("R/drake/plan.R")      # Build your workflow plan data frame.

# CHECK PLAN AND CLEAN ENVIRONMENT ----------------------------------------------

# check plan is in eviron
# ls()

# see what's outdated:
# r_outdated(r_args = list(show = FALSE))

# really remove things!
#clean(garbage_collection = TRUE)


# VISUALIZE PLAN ----------------------------------------------------------


# Visualize the graph of your workflow.
#vis_drake_graph(my_plan)
# vis_drake_graph(my_plan, targets_only = TRUE)


# RUN INTERACTIVELY--------------------------------------------------------

clean()

# RUN manually
make(my_plan) # Or make(my_plan, jobs = 2), etc.

# check for green
vis_drake_graph(my_plan, targets_only = TRUE)

# RUN IN CLEAN SESSION ----------------------------------------------------

# use r_make
r_make()

# check for green
vis_drake_graph(my_plan, targets_only = TRUE)


# Examples ----------------------------------------------------------------

# drake_examples()
# drake_example("gapminder")

# use _drake.R file for a clean session with r_make()