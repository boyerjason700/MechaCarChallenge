#MechCarChallenge

#Deliverable 1
#Use the library() function to load the dplyr package
library(dplyr)

#Import and read in the MechaCar_mpg.csv file as a dataframe
mecha <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)

#Perform linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha)

#Using the summary() function, determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha))

#p-value = 5.35e-11
#R squared = 0.7149

#Deliverable 2
#Import and read in the Suspension_Coil.csv file as a table
susp_coil <- read.csv(file='Suspension_coil.csv', check.names=F, stringsAsFactors=F)

#Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column
total_summary <- susp_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column
lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Lot 1 Variance 0.98 PSI
#Lot 2 Variance 7.46 PSI
#Lot 3 Variance 170.28 PSI

#Deliverable 3
#Write an RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(susp_coil$PSI, mu=1500)

#Write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch
t.test(subset(susp_coil, Manufacturing_Lot == 'Lot1')$PSI, mu=1500)
t.test(subset(susp_coil, Manufacturing_Lot == 'Lot2')$PSI, mu=1500)
t.test(subset(susp_coil, Manufacturing_Lot == 'Lot3')$PSI, mu=1500)
