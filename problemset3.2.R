library(tidyverse) 
class621 = read_csv("2019class6211.csv")

class621 = mutate(class621, bmi=(weight/height^2)*704.5 )

class621.F = filter(class621, sex=="Female") 
class621.M = filter(class621, sex=="Male") 

stem(class621.F$bmi) 
stem(class621.M$bmi) 

summary(class621.F$bmi) 
sd(class621.F$bmi) 
summary(class621.M$bmi) 
sd(class621.M$bmi)

25.72+5.762538*1.96
22.87+4.168*1.96

quantile(class621.F$bmi, c(.005, .025, .25, .75, .975, .995)
quantile(class621.F$bmi, c(.005, .025, .25, .75, .975, .995),  
         na.rm=TRUE) 
quantile(class621.M$bmi, c(.005, .025, .25, .75, .975, .995))
