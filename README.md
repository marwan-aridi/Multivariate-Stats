# Multivariate Statistics Analysis Project

This repository contains an in-depth analysis of multivariate statistical methods applied to a dataset of electric vehicle attributes. The project aims to explore the relationships between multiple variables and their influence on electric vehicle range and popularity. Key statistical techniques, such as multivariable linear regression and ANOVA, are implemented to extract meaningful insights.

---

## Project Objectives

1. **Data Cleaning and Preparation:**
   - Handle missing values by replacing them with appropriate measures (e.g., median for numerical variables and 'Unknown' for categorical variables).
   - Transform categorical variables into factors to prepare the dataset for statistical analysis.

2. **Multivariable Linear Regression:**
   - Investigate the relationship between electric vehicle range (dependent variable) and multiple predictor variables, including:
     - Make
     - Model
     - Model Year
     - Electric Vehicle Type
     - Base MSRP (Manufacturer's Suggested Retail Price)
     - Clean Alternative Fuel Vehicle (CAFV) Eligibility

3. **ANOVA (Analysis of Variance):**
   - Analyze how CAFV eligibility influences the popularity of different electric vehicle makes.
   - Visualize the distribution of vehicle popularity across CAFV eligibility categories using boxplots.

4. **Diagnostics and Model Validation:**
   - Generate diagnostic plots (e.g., residual plots, QQ plots) to assess the assumptions of the linear regression model.
   - Use statistical summaries to interpret the results of the analysis.

---

## Project Workflow

1. **Load and Clean Data:**
   - Import the dataset into R using `read.csv()`.
   - Filter out rows with missing values in critical columns such as `Electric Range`.
   - Replace missing categorical values with 'Unknown' and numerical values with their respective medians.

2. **Exploratory Data Analysis (EDA):**
   - Examine the distribution of variables to identify trends and potential outliers.
   - Create summary tables and visualizations to understand the dataset's structure.

3. **Model Implementation:**
   - Fit a multivariable linear regression model using `lm()` in R.
   - Summarize the model to interpret coefficients, p-values, and R-squared values.

4. **Visualization:**
   - Generate boxplots using `ggplot2` to visualize the effect of CAFV eligibility on vehicle popularity.
   - Create diagnostic plots for residuals, QQ plots, and scale-location plots to evaluate model assumptions.

5. **Interpretation and Reporting:**
   - Use the results of the regression model and ANOVA to draw conclusions about the factors influencing electric vehicle range and popularity.

---

## R Code Summary

The project utilizes several R packages, including `tidyverse` and `ggplot2`. Key code snippets include:

- **Linear Regression:**
  ```R
  model <- lm(Electric.Range ~ Make + Model + Model.Year + Electric.Vehicle.Type +
              Base.MSRP + Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, 
              data = ev_data_clean)
  summary(model)
  ```

- **ANOVA Analysis:**
  ```R
  anova_model <- aov(Make_Popularity ~ Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, 
                     data = data)
  summary(anova_model)
  ```

- **Boxplot:**
  ```R
  ggplot(data, aes(x = Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, y = Make_Popularity)) +
    geom_boxplot() +
    labs(title = "Make Popularity by CAFV Eligibility",
         x = "CAFV Eligibility",
         y = "Make Popularity") +
    theme_minimal()
  ```

---

## Applications

- **Industry Insights:** Identify the key factors that influence electric vehicle range and popularity.
- **Policy Making:** Understand the impact of clean fuel vehicle eligibility on market trends.
- **Educational Value:** Provide a comprehensive example of multivariate statistical analysis for students and researchers.

---

## How to Use

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/marwan-aridi/Multivariate-Stats.git
   ```

2. Open the R scripts provided in the repository.

3. Run the scripts using R or RStudio to reproduce the analysis.

4. Modify the code to apply similar techniques to other datasets.

---

## License
