##This syntax file is for the replication of Reeves (2012),
##Andrew Reeves. 2011. "Political Disaster: Unilateral Powers, Electoral Incentives, and Presidential Disaster Declarations."Journal of Politics, 73(4):1142-1151.
##R Version 2.14.1
library(gtools)
library(apsrtable)
library(MASS)

rm(list = ls())

##Set Working Director
#setwd("~/Dropbox/Articles/disaster_data/")

##Load the data
data <- read.csv("political_disaster_replication_t2.csv", stringsAsFactors = FALSE)

##Table 2 Model of Presidential Disaster Declarations, Pooled Model (Column 1) and Split Sample Model (Columns 2 and 3) (p. 1147)

##Col 1 (full)
reg<-glm(fema.dis ~ priv.dis + INSURADJ.L + log(ppinc.adj) + ev + comp + reagan1 + reagan2 + bush + clinton1 + wbush + p2 + p3 + p4 + cong.pres + pres.party + as.factor(state), family = poisson, data=data)

##Col 2 (pre-Stafford)
reg1<-glm(fema.dis ~ priv.dis + INSURADJ.L + log(ppinc.adj) + ev + comp + reagan1 + p2 + p3 + p4 + cong.pres + pres.party + as.factor(state), family = poisson, data=data[data$year < 1989,])

##Col 3 (post-stafford)
reg2 <- glm(fema.dis ~ priv.dis + INSURADJ.L + log(ppinc.adj) + ev + comp + bush + clinton1 + wbush + p2 + p3 + p4 + cong.pres + pres.party + as.factor(state), family = poisson, data=data[data$year>1988,])

##Formatted nicely for TeX using apsrtable
#apsrtable(reg, reg1, reg2, model.names = c("full", "pre-Stafford", "post-Stafford"), omitcoef = grep("factor", names(coefficients(reg1)), value = TRUE), coef.names = c("Intercept", "Private Disasters", "Insurance cost (logged)", "Per capita income", "Electoral Votes", "Competitiveness", "Reagan (term 1)", "Reagan (term 2)", "GHW Bush", "Clinton (term 1)", "W Bush",  "year 2 of admin", "year 3 of admin", "year 4 of admin", "Congressional partisanship", "President / Governor same party"), caption = "\\textbf{Model of Presidential Disaster Declarations, Pooled model (column 1) and Split sample model (columns 2 and 3).}  Pre-Stafford Act Model (column 2), omitted indicators are Year 1 of Administration and Reagan's second term.  Post-Stafford Act Model (column 3), omitted indicator variables are Year 1 of Administration and Bill Clinton's second term.  Estimates are from a Poisson regression.  State indicator variables are included in the model but not presented in the table.", label = "splitreg" )





