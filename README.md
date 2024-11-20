# R-Projects

### 01. Introduction to Econometrics Module Project

Here's a structured summary and interpretation of your econometrics module project:

---

### **Research Question and Focus**  
**Question**: *Do Foreign Direct Investments (FDI) and GDP growth impact a country’s level of exports?*  
- **Dependent Variable**: Exports (log-transformed)  
- **Independent Variables**:  
  - Main: Foreign Direct Investment (FDI) (% of GDP)  
  - Other: GDP Growth (annual %)  

**Hypothesis**:  
- **Null (H₀)**: No significant combined impact of FDI and GDP growth on exports. (β₁ = 0)  
- **Alternative (Hₐ)**: Significant combined positive impact of FDI and GDP growth on exports. (β₁ ≠ 0)  

---

### **Data Overview**  
- **Source**: World Bank, IMF, OECD databases  
- **Time Frame**: 1960-2021  
- **Observations**: 16,493 (across 266 countries)  
- **Variable Metrics**:  
  - Exports (USD, log-transformed for linearity and normality)  
  - FDI (% of GDP)  
  - GDP Growth (annual %)
![image](https://github.com/user-attachments/assets/46aa2639-055d-4c64-b256-52cbd426a449)

---

### **Regression Model**  
**Model**:  
\[
\text{log(Exports)} = \beta_0 + \beta_1 \text{FDI} + \beta_2 \text{GDP Growth} + \epsilon_i
\]

- **Rationale**: FDI fosters export competitiveness via technology transfer, market access, and improved practices. GDP growth boosts production capacity and export demand.  
- **OLS Results**:  
  - P-values < 0.05 for FDI and GDP growth indicate statistical significance / prove there is a relationship.  

---

### **Diagnostics and Robustness**  

1. **Multicollinearity**:  
   - Variance Inflation Factor (VIF) < 10 for all variables; no multicollinearity.
   - ![image](https://github.com/user-attachments/assets/a3beb586-a29d-49cf-a5dc-97df3bda313e)


2. **Heteroscedasticity**:  
   - Detected using Breusch-Pagan test (p-value < 0.05).
   - ![image](https://github.com/user-attachments/assets/4564f6f3-dc29-4719-9006-5f14b3614d83)
   - Addressed using robust standard errors.
   - ![image](https://github.com/user-attachments/assets/f0dbe14f-7806-4fed-a4e4-ddf6cf13ee4c)
   - ![image](https://github.com/user-attachments/assets/c04809bc-cfa7-421b-afbe-a2ce0dd54312)
   - Testing BP test again (p value less than 0.5 - there is heteroscedasticity)
   - ![image](https://github.com/user-attachments/assets/a933ff48-8271-4813-b11f-df5bff24a9a5)

3. **Model Misspecification**:  
   - Ramsey RESET test suggests potential misspecification (p-value < 0.05).
   - ![image](https://github.com/user-attachments/assets/58550200-fb2c-46d4-9573-61450e47e63e)
   - The results indicate that the model has a missing variable or functional form misspecification, and that the existing model specification is inadequate.
   - Possible omitted variables (e.g., employment).  

4. **Serial Correlation**:  
   - Durbin-Watson statistic = 0.078 (indicating positive autocorrelation).
   - When the residuals of a regression model are not distributed independently, autocorrelation arises. 
   - ![image](https://github.com/user-attachments/assets/41bd956e-1a35-41c5-b840-21ae1a90a078)
   - Alternative methods (e.g., GLS) recommended to address autocorrelation.

---

### **Panel Data Analysis**  

- **Fixed Effects (FE) vs. Random Effects (RE)**:  
  - Hausman Test: Test statistic = 72.99 (p-value < 0.05).
  - ![image](https://github.com/user-attachments/assets/67e937d9-74f8-46fa-aaf2-b7b66c878be5)
  - Conclusion: Fixed Effects model preferred (RE inconsistent).
  - ![image](https://github.com/user-attachments/assets/38f8f344-5aa0-424b-9fb5-8b93413eeed5)
  - ![image](https://github.com/user-attachments/assets/e2931f3f-52aa-4abb-b42c-f7d56e330194)


---

### **Findings and Recommendations**  

1. **Hypothesis Testing**:  
   - FDI and GDP growth are significant predictors of exports, but the low R² suggests other factors might play a larger role.  

2. **Limitations**:  
   - **Low Fit**: Only 1.07% of variance in exports explained.  
   - **Omitted Variables**: Employment and other factors should be included.  
   - **Model Assumptions**: Serial correlation and heteroscedasticity indicate the need for alternative estimation techniques.

3. **Future Work**:  
   - Expand the model by adding omitted variables (e.g., infrastructure, trade policies).  
   - Use advanced models like GLS or dynamic panel models to address serial correlation and autocorrelation.  

---

### **Interpretation**  
The study confirms the relationship between FDI, GDP growth, and exports but highlights the complexity of export determinants. Incorporating additional variables and refining the model can better capture the dynamics of trade economics.
