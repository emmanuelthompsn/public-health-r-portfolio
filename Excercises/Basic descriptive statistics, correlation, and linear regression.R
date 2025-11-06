# Basic descriptive statistics, correlation, and linear regression
# using base R functions only.

# 1. Set and check working directory
getwd()  # Shows current working directory
# setwd("path_to_your_folder")  # Uncomment and set if needed

# 2. Import dataset
COPD <- read.csv("COPD_student_dataset (1).csv", header = TRUE)  # Assign dataset
View(COPD)  # View the dataset in RStudio

# 3. Explore variables with histograms
hist(COPD$MWT1Best,
     main = "Histogram of MWT1Best",
     xlab = "MWT1Best (6-minute walk test)",
     col = "lightblue", border = "white")

hist(COPD$AGE,
     main = "Histogram of AGE",
     xlab = "Age (years)",
     col = "lightgreen", border = "white")

# 4. Summary statistics for MWT1Best
list(
  Summary = summary(COPD$MWT1Best),
  Mean    = mean(COPD$MWT1Best, na.rm = TRUE),
  SD      = sd(COPD$MWT1Best, na.rm = TRUE),
  Range   = range(COPD$MWT1Best, na.rm = TRUE),
  IQR     = IQR(COPD$MWT1Best, na.rm = TRUE)
)

# 5. Summary statistics for AGE
list(
  Summary = summary(COPD$AGE),
  Mean    = mean(COPD$AGE, na.rm = TRUE),
  SD      = sd(COPD$AGE, na.rm = TRUE),
  Range   = range(COPD$AGE, na.rm = TRUE),
  IQR     = IQR(COPD$AGE, na.rm = TRUE)
)

# 6. Scatter plot: MWT1Best vs AGE
plot(COPD$AGE, COPD$MWT1Best,
     main = "Scatterplot of MWT1Best vs AGE",
     xlab = "AGE (years)",
     ylab = "MWT1Best",
     pch = 19, col = "darkblue")
abline(lm(MWT1Best ~ AGE, data = COPD), col = "red", lwd = 2)

# 7. Correlation test (Pearson)
cor.test(COPD$MWT1Best, COPD$AGE,
         use = "complete.obs",
         method = "pearson")

# 8. Linear regression: MWT1Best predicted by AGE
MWT1Best_AGE <- lm(MWT1Best ~ AGE, data = COPD)
summary(MWT1Best_AGE)   # Regression summary
confint(MWT1Best_AGE)   # 95% confidence intervals

# 9. Predicted values and residuals
predictedVals <- predict(MWT1Best_AGE)   # Predicted values
residualVals  <- residuals(MWT1Best_AGE) # Residuals

# 10. Diagnostic plots
par(mfrow = c(2, 2))  # Arrange plots in 2x2 grid
plot(MWT1Best_AGE)    # Residual plots, QQ plot, etc.
par(mfrow = c(1, 1))  # Reset plotting layout