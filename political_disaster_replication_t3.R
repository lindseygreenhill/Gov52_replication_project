##This syntax file is for the replication of Reeves (2012),
##Andrew Reeves. 2011. "Political Disaster: Unilateral Powers, Electoral Incentives, and Presidential Disaster Declarations."Journal of Politics, 73(4):1142-1151.
##R Version 2.14.1
library(apsrtable)

rm(list = ls())

##Set Working Director
#setwd("~/Dropbox/Articles/disaster_data/")

##Load the data 
data1<-read.csv("political_disaster_replication_t3.csv")

##Table 3 Model of State-Wide Presidential Election Outcomes
##Col 1
pvote1<-lm(curr.pct ~  prev.pct + fema.dis  + log(ppinc.adj) + pinc.chg + cong.pres + pres.party  + comp + ev + incumb + as.factor(state), data = data1)

##Col 2
pvote2<-lm(curr.pct ~  prev.pct + sqrt(fema.dis)  + log(ppinc.adj) + pinc.chg + cong.pres + pres.party  + comp + ev + incumb + as.factor(state), data = data1)

##Formatted nicely for TeX using apsrtable
#apsrtable(pvote1, pvote2, omitcoef = grep("factor", names(coefficients(pvote1)), value = TRUE), coef.names = c("Intercept", "Previous Vote Share", "Presidential Disaster Declarations",  "Personal Per Capita Income (logged)", "Change in Per Capita Income", "Congressional Partisanship", "Governor's Partisanship", "Competitiveness", "Electoral Votes", "Incumbent", "Presidential Disaster Declarations (sqrt)"))

