library(tidyverse) 
nepal621 <- read_csv("nepal621.csv")

CT  =  table(nepal621$trt,  nepal621$status)
addmargins(CT) 
prop.table(CT, margin=1)

nepal.plac  =  filter(nepal621,  trt=="Placebo")
nepal.vit  =  filter(nepal621,  trt=="Vit A") 

CT  =  table(nepal.plac$sex,  nepal.plac$status)
addmargins(CT) 
prop.table(CT, margin=1) 

CT  =  table(nepal.vit$sex,  nepal.vit$status)
addmargins(CT) 
prop.table(CT, margin=1)
