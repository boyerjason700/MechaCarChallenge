# MechaCarChallenge

## Linear Regression to Predict MPG
### Summary

- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
  - Vehicle Length and Ground Clearance(as well as Intercept) are statistically unlikely to provide random amounts of variance to the linear model. Vehicle Length having a p-value of 2.60e-12 and Ground Clearance having a p-value of 5.21e-08 both show to have statistical significance on MPG.
- Is the slope of the linear model considered to be zero? Why or why not?
  - The p-value from our model is below a significance level of 0.05% so we are able to reject the null hypothesis, identifying that the slope of this model is not zero. 
- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
  - The R-squared value for this model is 0.715 which shows that 71% of the observed variations can be explained by this models inputs, proving to be a good model to predict MPG effectively.

![lm of MPG](https://user-images.githubusercontent.com/74840026/135731826-743fdd32-cea7-4bc5-831e-20919b14f1bb.PNG)

## Summary Statistics on Suspension Coils
### Summary

- The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?
  - The overall variance for all lots is 62.3 PSI, which meets design specifications.  Summary of manufacturing lots show Lot 1 having a variance of 0.98 PSI and Lot 2 having a variance of 7.5 PSI; which are both below the design specification requirements.  However, suspension coils from Lot 3 show a variance of 170.3 PSI, which is outside of the design specification requirements.

Total Variance

![total_summary](https://user-images.githubusercontent.com/74840026/135732750-c313c87a-56ec-4fb4-8291-e5c601e86bd9.PNG)
<br>

Lot Variance

![lot_summary](https://user-images.githubusercontent.com/74840026/135732752-a77aa29a-595c-41e0-9c71-2b2ba5cc3c95.PNG)

## T-Tests on Suspension Coils
### Summary
- All Manufacturing Lot T Test

![all_mu1500](https://user-images.githubusercontent.com/74840026/135733347-42c801f9-58d4-4cc5-ad3d-d138b4ec3c59.PNG)
- P-Value for all lots is 0.06 which is above our significance level of 0.05; fail to reject null hypothesis.


- Lot 1 T Test

![lot1_mu1500](https://user-images.githubusercontent.com/74840026/135733314-df781499-3b07-409e-b8a6-565fcf8177bb.PNG)
- P-Value for Lot 1 is 1 which is above our significance level of 0.05; fail to reject null hypothesis.


- Lot 2 T Test

![lot2_mu1500](https://user-images.githubusercontent.com/74840026/135733316-2146b29c-2aee-423a-b770-9f8a037356ff.PNG)
- P-Value for Lot 2 is 0.06 which is above our significance level of 0.05; fail to reject null hypothesis.


- Lot 3 T Test

![lot3_mu1500](https://user-images.githubusercontent.com/74840026/135733319-dc3b5f3c-0130-431c-adc1-47eedf63f99b.PNG)
- P-Value for Lot 3 is 0.04 which is below our significance level of 0.05; reject null hypothesis.



