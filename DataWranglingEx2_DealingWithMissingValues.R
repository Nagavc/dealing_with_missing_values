
###### DATA WRANGLING EXERCISE 2: DEALING WITH MISSING VALUES

## 0. LOAD THE DATA IN RSTUDIO
data_path = 'C:/Users/Naga Viraja/Desktop/Foundations of Data Science/Data Wrangling Projects/Dealing_with_Missing_Values/titanic_original.csv'
df <- read.csv(data_path, header = TRUE)
str(df)


## 1. PORT OF EMBARKATION
df$embarked <- sub('^$', 'S', df$embarked)
str(df$embarked)

## 2. AGE
# 2a. Calculate the mean of the Age column and use that value to populate the missing values
df$age[is.na(df$age)] <- round(mean(df$age, na.rm = TRUE))

# 2b. other ways to populate missing values in age column
# populating the missing values with 'NA' for the below reasons-
#             replacing with mean does not provide appropriate age
#             it saves unnecessary computation time         


## 3. LIFEBOAT
df$boat <- sub('^$', 'NA', df$boat) 

## 4. CABIN
df$has_cabin_number = ifelse(df$cabin == '', 0, 1)

## 6. SUBMIT THE PROJECT ON GITHUB
write.csv(x = df, file = 'titanic_clean.csv')