# SURVIVAL ANALIZA #

library(survival)
library(ggplot2)
library(ggpubr)
library(survminer)

data("lung")
head(lung)

#procjena krivulje
fit <- survfit(Surv(time, status) ~ sex, data = lung)
print(fit)

names(fit)
dataframe <- data.frame(time = fit$time, n.risk = fit$n.risk,n.event = fit$n.event,n.censor = fit$n.censor,surv = fit$surv,upper = fit$upper,lower = fit$lower)


#prikaz
ggsurvplot(fit,pval = TRUE, conf.int = TRUE, risk.table = TRUE, risk.table.col = "strata",linetype = "strata", surv.median.line = "hv",ggtheme = theme_bw())


#Kaplan-Meier
res.sum <- surv_summary(fit)
head(res.sum)

  