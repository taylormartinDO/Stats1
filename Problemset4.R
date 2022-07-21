
library(tidyverse) 
balt621 <- read_csv("balt621.csv")

#Stratify the daily mortality data into 4 groups by season using the season variable.   
#Calculate the mean PM10 level and mean daily mortality by season. 
balt621 %>%   
  group_by(season) %>%   
  summarize(n_pm10 = sum(!is.na(pm10)), mean_pm10 = mean(pm10, na.rm=TRUE),              
            n_mortality = sum(!is.na(death)), mean_mortality = mean(death))

#For each of the four seasonal strata, stratify the days into 5 pollution (pm10) strata. 
pm10winter <- filter(balt621, season=="Winter") 
quintiles = quantile(pm10winter$pm10, c(0,.2,.4,.6,.8,1), na.rm=TRUE) 
pm10winter$pm_group = cut(pm10winter$pm10, breaks=quintiles, labels=1:5) 
table(pm10winter$pm_group)

pm10spring <- filter(balt621, season=="Spring") 
quintiles = quantile(pm10spring$pm10, c(0,.2,.4,.6,.8,1), na.rm=TRUE) 
pm10spring$pm_group = cut(pm10spring$pm10, breaks=quintiles, labels=1:5) 
table(pm10spring$pm_group)

pm10summer <- filter(balt621, season=="Summer") 
quintiles = quantile(pm10summer$pm10, c(0,.2,.4,.6,.8,1), na.rm=TRUE) 
pm10summer$pm_group = cut(pm10summer$pm10, breaks=quintiles, labels=1:5) 
table(pm10summer$pm_group)

pm10autumn <- filter(balt621, season=="Autumn") 
quintiles = quantile(pm10autumn$pm10, c(0,.2,.4,.6,.8,1), na.rm=TRUE) 
pm10autumn$pm_group = cut(pm10autumn$pm10, breaks=quintiles, labels=1:5) 
table(pm10autumn$pm_group)


#Separately for your four seasonal strata, calculate the mean mortality in the lowest and highest of the five pollution strata. 
pm10winter %>% filter(pm_group==1) %>%    
  summarize(mean=mean(death), sd=sd(death), n=n())
pm10winter %>% filter(pm_group==5) %>%   
  summarize(mean=mean(death), sd=sd(death), n=n())

pm10spring %>% filter(pm_group==1) %>%    
  summarize(mean=mean(death), sd=sd(death), n=n())
pm10spring %>% filter(pm_group==5) %>%   
  summarize(mean=mean(death), sd=sd(death), n=n())
            
pm10summer %>% filter(pm_group==1) %>%    
  summarize(mean=mean(death), sd=sd(death), n=n())
pm10summer %>% filter(pm_group==5) %>%   
  summarize(mean=mean(death), sd=sd(death), n=n())
                        
pm10autumn %>% filter(pm_group==1) %>%    
  summarize(mean=mean(death), sd=sd(death), n=n())
pm10autumn %>% filter(pm_group==5) %>%   
  summarize(mean=mean(death), sd=sd(death), n=n())

#Within each seasonal stratum, test the null hypothesis that the mean mortality is the same regardless of the pollution level by comparing the mean mortality in the lowest and highest pollution strata. Given the large sample sizes, there is no need to pool the variances.

pm10winter.15 = pm10winter %>% filter(pm_group==1 | pm_group==5) 
t.test(death ~ pm_group, data=pm10winter.15, var.equal=FALSE)

pm10spring.15 = pm10spring %>% filter(pm_group==1 | pm_group==5) 
t.test(death ~ pm_group, data=pm10spring.15, var.equal=FALSE)

pm10summer.15 = pm10summer %>% filter(pm_group==1 | pm_group==5) 
t.test(death ~ pm_group, data=pm10summer.15, var.equal=FALSE)

pm10autumn.15 = pm10autumn %>% filter(pm_group==1 | pm_group==5) 
t.test(death ~ pm_group, data=pm10autumn.15, var.equal=FALSE)


