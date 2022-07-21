library(tidyverse) 
class621 = read_csv("2019class6211.csv")

class621= filter(class621, weight >= 50)
class621 = mutate(class621, bmi=(weight/height^2)*704.5 )

boxplot(class621$height) 
boxplot(class621$weight) 

class621.F = filter(class621, sex=="1") 
class621.M = filter(class621, sex=="2") 

stem(class621.F$bmi) 
stem(class621.M$bmi) 

summary(class621.F$bmi) 
sd(class621.F$bmi) 
summary(class621.M$bmi)
sd(class621.M$bmi) 

pnorm(25, 22.87, 4.168)
pnorm(25, 25.72, 5.76)
pnorm(30, 22.87, 4.168)
0.9564274-0.6953372
1-0.9564274

pnorm(30, 25.72, 5.76)
0.771276-0.4502618
1-0.771276

quantile(class621.F$bmi, c(.005, .025, .25, .75, .975, .995),  
         na.rm=TRUE) 
38.08297-18.99754
19.08543/2
pnorm(25, 28.54, 4.868)
pnorm(30, 28.54, 4.868)
0.6178801-0.2335523
1-0.6178801

quantile(class621.M$bmi, c(.005, .025, .25, .75, .975, .995))
((33.80177-17.54370)/2)+17.54370 #mean of actual
(25.67273-17.54370)/1.96 #SD of actual

pnorm(25, 25.67273, 4.147464) #calculation of <25
pnorm(30, 25.67273, 4.1474648) #calculation of <30
0.8516076-0.4355731 #25-30
1-0.8516076 #>30

qqnorm(class621$bmi)
qqline(class621$bmi)        

#Adding gridlines at median and Q1/Q3     
abline(h=quantile(class621$bmi, c(.25,.5,.75), na.rm=TRUE), lty=2)                 
abline(v=qnorm(c(.25,.5,.75)), lty=2)

qqnorm(class621.F$bmi);         qqline(class621.F$bmi)        
abline(h=quantile(class621.F$bmi, c(.25,.5,.75), na.rm=TRUE), lty=2)            
abline(v=qnorm(c(.25,.5,.75)),         lty=2)

qqnorm(class621.M$bmi);         qqline(class621.M$bmi)       
abline(h=quantile(class621.M$bmi, c(.25,.5,.75), na.rm=TRUE), lty=2)                
abline(v=qnorm(c(.25,.5,.75)),         lty=2)

qqplot(class621.F$bmi, class621.M$bmi, xlim=c(5,40), ylim=c(5,40))              
abline(a=0,         b=1)
