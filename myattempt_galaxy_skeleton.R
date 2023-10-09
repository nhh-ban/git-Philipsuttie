
library(tidyverse)

# Read the entire data file into memory
raw_file <- readLines("suites_dw_Table1.txt")

# Identify the line number L of the separator line
L <- which(substr(x = raw_file, start = 1, stop = 2) == "--")[1]
L

# Save the variable descriptions in a text file
cat(raw_file[1:(L - 2)], sep = "\n", file = "variable_descriptions.txt")

# Extract the variable names
variable_names <- 
  str_split(string = raw_file[L - 1], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

# Read the data and save it to a CSV file
data_lines <- raw_file[(L + 1):length(raw_file)]
comma_separated_values <- 
  data_lines %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)    

cat(comma_separated_values_with_names, sep = "\n", file = "galaxies.csv")

# Read the CSV file into a data frame
galaxies <- read_csv("galaxies.csv")
