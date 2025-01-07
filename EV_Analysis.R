
# Load necessary libraries
library(tidyverse)

# Load the dataset
ev_data <- read.csv("/mnt/data/Electric_Vehicle_Population_Data.csv")

# Cleaning the data
# Remove rows with missing Electric Range
ev_data_clean <- ev_data %>%
filter(!is.na(Electric.Range))

# Select relevant columns and handle missing values
# Replace NA in categorical variables with 'Unknown' and numeric columns with median
predictor_vars <- c("Make", "Model", "Model.Year", "Electric.Vehicle.Type",
"Base.MSRP", "Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility")

ev_data_clean <- ev_data_clean %>%
mutate(across(all_of(predictor_vars), ~ ifelse(is.na(.), 'Unknown',
as.character(.)))) %>%
mutate(Base.MSRP = ifelse(is.na(Base.MSRP), median(ev_data_clean$Base.MSRP,
na.rm = TRUE), Base.MSRP),
Model.Year = ifelse(is.na(Model.Year),
median(ev_data_clean$Model.Year, na.rm = TRUE), Model.Year))

# Convert categorical variables to factors
ev_data_clean <- ev_data_clean %>%
mutate(across(c(Make, Model, Electric.Vehicle.Type,
Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility), as.factor))

# Fit the multivariable linear regression model
model <- lm(Electric.Range ~ Make + Model + Model.Year + Electric.Vehicle.Type
+ Base.MSRP + Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, data =
ev_data_clean)

# Summarize the model to see the results
summary(model)

# Plot diagnostics to check assumptions
par(mfrow = c(2, 2))
plot(model) # Residuals, QQ plot, Scale-location

# Reset plotting layout
par(mfrow = c(1, 1))

# Additional ANOVA Code
# Load dataset
data <- read.csv("C:/Users/haotr/Downloads/Electric_Vehicle_Population_Data.csv")

data$Make_Popularity <- as.numeric(table(data$Make)[data$Make])

# Fit the MANOVA model
anova_model <- aov(Make_Popularity ~
Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, data = data)

# Summary of the MANOVA model
summary(anova_model)

# Boxplot to visualize the distribution of Make_Popularity by CAFV_Eligibility
ggplot(data, aes(x = Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, y =
Make_Popularity)) +
geom_boxplot() +
labs(title = "Make Popularity by CAFV Eligibility",
x = "CAFV Eligibility",
y = "Make Popularity") +
theme_minimal()
