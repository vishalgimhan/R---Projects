#Loading the dataset
library(readxl)
research1 <- read_excel("F:/Semester 4/Introduction to Econometrics - DA2420/Assignment/DatasetNew.xlsx")

summary(research1)

#4. Summary Statistics of Variables
summary(research1$Exports)
summary(research1$FDI)
summary(research1$GDPgrowth)

#5. Regression model-Specifying functional form
research1$Exports <- log1p(research1$Exports)

#6.Regression model - Pooled OLS
model1 <- lm(formula = Exports ~ FDI + GDPgrowth, data=research1)

#6.1 Summary of Pooled OLS
summary(model1)

#7. multicollinearity, heteroscedasticity, model misspecification and serial correlation

#7.1 Diagnostics for Multicollinearity
#install.packages("car")
library(car)
vif(model1)

#7.2 Diagnostics for Heteroscedascity
#install.packages("zoo")
#install.packages("lmtest")
library(lmtest)

#BP Test
bptest(model1)

#white test
u1 <- model1$residuals^2
y1 <- fitted(model1)
r1 <- summary(lm(u1 ~ y1 + I(y1^2)))$r.squared
LM1 <- nrow(research1)*r1
p.value <- 1-pchisq(LM1, 2)
p.value

#Robust standard errors
#install.packages("estimatr")
library(estimatr)

#classical
model1_classical <- lm_robust(Exports ~ FDI + GDPgrowth,data = research1, se_type = "classical")
summary(model1_classical)

#stata
model1_robust <- lm_robust(Exports ~ FDI + GDPgrowth,data = research1, se_type = "stata")
summary(model1_robust)

#BP test again
bptest(model1_robust)

#7.3 Diagnostic  for functional form misspecification
library(lmtest)
model_reset <- resettest(Exports ~ FDI +  GDPgrowth, power = 2:3, type = ("fitted") , data = research1)
model_reset

#7.4 Diagnostic for Serial Correlation
library(lmtest)
model_dwtest <- lm(Exports ~ FDI +  GDPgrowth, data= research1)
dwtest(model_dwtest)

#Check for Outliers
#boxplot(research1$Exports, ylab = "Exports")
#boxplot.stats(research1$Exports)$out

#9.PANEL DATA
library(plm)

#9.1 Estimating Within-Group estimator (FE)
model_fixed <- plm(Exports ~ FDI +  GDPgrowth, data = research1, index=c("Country","Year"),model="within")
summary(model_fixed)

#9.2 Estimating Random effects estimator (RE)
model_random <- plm(Exports ~ FDI +  GDPgrowth, data = research1, index=c("Country","Year"),model="random")
summary(model_random)

#10. Testing which is better FE or RE
phtest(model_fixed,model_random)

