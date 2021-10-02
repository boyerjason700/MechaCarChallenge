x <- c(3, 3, 2, 2, 5, 5, 8, 8, 9)
x[3]
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
demo_table[3,'Year']
demo_table[3,3]
demo_table$'Vehicle_Class'[2]
demo_table2 <- fromJSON(txt='demo.json')
filter_table <- demo_table2[demo_table2$price > 10000,]
?subset()

filter_table2 <- subset(demo_table2, price > 10000 & drive == '4wd' & 'clean' %in% title_status) 
#filter by price and drivetrain

filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & (demo_table2$price > 10000) & (demo_table2$drive == "4wd"),]
?sample()

sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

num_rows <- 1:nrow(demo_table)
sample_rows <- sample(num_rows, 3)
demo_table[sample_rows,]

demo_table[sample(1:nrow(demo_table), 3),]

library(tidyverse)
?mutate()

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 
#add columns to original data frame

summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer)) 
#create summary table

summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') 
#create summary table with multiple columns

?gather()
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

long_table <- gather(demo_table3, key='Metric', value = 'Score', buying_price:popularity)

?spread()
wide_table <- long_table %>% spread(key="Metric",value="Score")
all.equal(demo_table3, wide_table)
?ggplot()
head(mpg)
plt <- ggplot(mpg,aes(x=class)) 
plt + geom_bar() 
? geom_bar()
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups='keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=manufacturer, y=Vehicle_Count)) #import dataset into ggplot
plt + geom_col() # plot a bar plot
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + # plot bar plot with labels
theme(axis.text.x=element_text(angle=45, hjust=1)) # rotate the x-axis label 45 degrees
mpg_summary <- subset(mpg, manufacturer=='toyota') %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups='keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=cyl, y=Mean_Hwy)) # import dataset into ggplot
plt + geom_line()
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks= c(15:30)) #add line plot with labels
plt <- ggplot(mpg, aes(x=displ, y=cty)) #import dataset into ggplot
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") #add scatter plot with labels
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class, shape=drv, size=cty)) #import data set into ggolot
plt + geom_point() + labs(x="Engine Size(L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class", shape="Type of Drive") #add scatter plot with labels
plt <- ggplot(mpg, aes(x=manufacturer, y=hwy)) #import dataset into ggplot
plt + geom_boxplot() +  theme(axis.text.x=element_text(angle=45, hjust=1)) #adds boxplot
mpg_summary <-mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=class, y=factor(year), fill=Mean_Hwy))                                
plt + geom_tile() + labs(x="Vehicle Class", y="Vehicle Year", fill="Mean Highway (MPG)") #create heatmap with labels

mpg_summary <- mpg %>% group_by(model, year) %>% summarize(Mean_Hwy=mean(hwy), .groups='keep') # create summary table
plt <- ggplot(mpg_summary, aes(x=model, y=factor(year), fill=Mean_Hwy))
plt + geom_tile() + labs(x="Models", y="Vehicle Year", fille="Mean Highway (MPG)") + theme(axis.text.x=element_text(angle=90, hjust=1, vjust=.5))

plt <- ggplot(mpg, aes(x=manufacturer, y=hwy))
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45, hjust=1)) + geom_point() 

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups ='keep')
plt <- ggplot(mpg_summary, aes(x=class, y=Mean_Engine))
plt + geom_point(size=4) + labs(x="Vehicle Class", y="Mean Engine Size") 

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=class, y=Mean_Engine))
plt + geom_point(size=4) + labs(x="Vehicle Class", y="Mean Engine Size") +
  geom_errorbar(aes(ymin=Mean_Engine-SD_Engine, ymax=Mean_Engine+SD_Engine))

mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=class)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(class)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

ggplot(mtcars, aes(x=wt)) + geom_density()

?shapiro.test()

shapiro.test(mtcars$wt)

?sample_n()

population_table <- read.csv('used_car_data.csv', check.names = F, stringsAsFactors =F,)
plt <- ggplot(population_table, aes(x=log10(Miles_Driven)))
plt + geom_density()

sample_table <- population_table %>% sample_n(50)
plt <- ggplot(sample_table, aes(x=log10(Miles_Driven)))
plt + geom_density()

?t.test()
t.test(log10(sample_table$Miles_Driven), mu=mean(log10(population_table$Miles_Driven)))

sample_table2 <- population_table %>% sample_n(50)

t.test(log10(sample_table$Miles_Driven), log10(sample_table2$Miles_Driven))

mpg_data <- read.csv('mpg_modified.csv')
mpg_1999 <- mpg_data %>% filter(year==1999)
mpg_2008 <- mpg_data %>% filter(year==2008)

t.test(mpg_1999$hwy, mpg_2008$hwy, paired = T)

?aov()

mtcars_filt <- mtcars[,c('hp','cyl')]
mtcars_filt$cyl <- factor(mtcars_filt$cyl)

aov(hp ~ cyl, data = mtcars_filt)
summary(aov(hp ~ cyl, data = mtcars_filt))

?cor()

head(mtcars)
plt <- ggplot(mtcars, aes(x=hp, y=qsec))
plt + geom_point()

cor(mtcars$hp, mtcars$qsec)
 
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)
head(used_cars)

plt <- ggplot(used_cars, aes(x=Miles_Driven, y=Selling_Price))
plt + geom_point()

cor(used_cars$Miles_Driven, used_cars$Selling_Price)

used_matrix <- as.matrix(used_cars[,c('Selling_Price', 'Present_Price','Miles_Driven')])
cor(used_matrix)

?lm()
lm(qsec ~ hp, mtcars)
summary(lm(qsec ~ hp, mtcars))

model <- lm(qsec ~ hp, mtcars)
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)']

plt <- ggplot(mtcars, aes(x=hp, y=qsec))
plt + geom_point() + geom_line(aes(y=yvals), color='red')


#multiple linear regression
lm(qsec ~ mpg + disp + drat + wt + hp, data=mtcars) #generate multiple linear regression model
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

?chisq.test()

table(mpg$class, mpg$year)
tbl <- table(mpg$class, mpg$year)
chisq.test(tbl)

mpg
table(mpg$year, mpg$hwy)
tbl <- table(mpg$year, mpg$hwy)
chisq.test(tbl)
