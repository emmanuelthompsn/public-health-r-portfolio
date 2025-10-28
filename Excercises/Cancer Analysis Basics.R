
# 1. Check current working directory and files
getwd()                     # confirm current working directory
list.files()                 # list all files/folders in this directory
list.files("Data Set")       # list files inside the "Data Set" folder

# 2. Load the dataset
cancer_data <- read.csv("Data Set/cancer data for MOOC 1.csv", header = TRUE)
head(cancer_data)            # display the first 6 rows of the dataset

# 3. Create a new column: five_a_day
#    "Yes" if fruit + veg >= 5, otherwise "No"
cancer_data$five_a_day <- ifelse(
  cancer_data$fruit + cancer_data$veg >= 5, "Yes", "No"
)

# 4. Chi-squared test
#    Test association between consuming 5-a-day and cancer status
chisq.test(
  x = cancer_data$five_a_day,
  y = cancer_data$cancer
)

# 5. Independent t-test
#    Compare mean BMI between people with and without cancer
t.test(
  bmi ~ cancer,
  data = cancer_data
)
