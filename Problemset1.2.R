library(tidyverse) 
ce621 <- read_csv("ce621.csv") 

ce621.male = filter(ce621, sex=="Male") 
ce621.female = filter(ce621, sex=="Female") 
stem(ce621.male$totchg) 
stem(ce621.female$totchg)

summary(ce621.male$totchg)     
sd(ce621.male$totchg)   
quantile(ce621.male$totchg, c(0,.1,.25,.5,.75,.9,1)) 

summary(ce621.female$totchg) 
sd(ce621.female$totchg) 
quantile(ce621.female$totchg, c(0,.1,.25,.5,.75,.9,1))
