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

