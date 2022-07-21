library(tidyverse)

ps1 <- read_csv(baltps1.csv)
ps1<-read_csv(baltps11)
ps1 <- read_csv("baltps11.csv")


ps1.1 = filter(ps1, group==1) 
ps1.2 = filter(ps1, group==2) 
stem(ps1.1$deaths) 
stem(ps1.1$deaths, scale=1); stem(ps1.1$deaths, scale=3) 

stem(ps1.2$deaths)
stem(ps1.2$deaths, scale=1); stem(ps1.2$deaths, scale=3)

boxplot(deaths ~ group, data=ps1)
