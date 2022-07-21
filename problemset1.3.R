ce621e <- read_csv("ce621entire.csv") 

ce621e95 = filter(ce621e, year==1995) 
ce621e95$agecat = cut(ce621e95$age, c(0, 50, 64, 100),  right=TRUE, labels=c("<=50","51-64",">=65")) 
boxplot(totchg ~ sex + agecat, data=ce621e95, names=c("F <= 50",  "M <= 50","F 51-64", "M 51-64", "F >=65", "M >=65"))

ce621e95$log10chg = log10(ce621e95$totchg) 
boxplot(log10chg ~ sex + agecat, data=ce621e95,  names=c("F <= 50", "M <= 50","F 51-64", "M 51-64",  "F >=65", "M >=65"))
