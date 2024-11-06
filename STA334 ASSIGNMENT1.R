# 1. Function to detect missing values in a dataset
detect_missing_values <- function(data) {
  missing_counts <- colSums(is.na(data))
  missing_counts <- missing_counts[missing_counts > 0]
  return(missing_counts)
}

sample_data <- data.frame(
  A = c(1, 2, NA, 4, 5),
  B = c(NA, 2, 3, 4, 5),
  C = c(1, 2, 3, 4, 5)
)

print(detect_missing_values(sample_data))

print(detect_missing_values(airquality))

data1 <- mtcars
data1[c(1,2,3,4), c(5,4,3,2,1)] <- NA
print(detect_missing_values(data1))

# 2. Calculate median for each variables.
calculate_median<-function(data){
  medians<-numeric(0)
  
  for(col_name in colnames(data)){
    if(is.numeric(data[[col_name]])){
      medians[col_name]<-median(data[[col_name]],na.rm=TRUE)
    } else{
      cat(paste("Skipping non-numeric column:",col_name,"\n"))
    }
  }
  
  return(medians)
}

calculate_median(sample_data)

calculate_median(airquality)

calculate_median(data1)

# 3. Function to replace missing values with median values
replace_with_median <- function(data) {
  for (col_name in colnames(data)) {
    if (is.numeric(data[[col_name]])) {
      col_median <- median(data[[col_name]], na.rm = TRUE)
      data[[col_name]][is.na(data[[col_name]])] <- col_median
    } else {
      cat(paste("Skipping non-numeric column:", col_name, "\n"))
    }
  }
  return(data)
}

sample_data <- data.frame(
  x = c(1, 2, NA, 4, 5),
  y = c(NA, 2, 3, NA, 5),
  z = c("a", "b", "c", "d", "e")
)

sample_data_filled <- replace_with_median(sample_data)
print(sample_data)

airquality_filled <- replace_with_median(airquality)
print(head(airquality))

data1 <- mtcars
data1[1, 1] <- NA
data1[5, 3] <- NA

data1_filled <- replace_with_median(data1)
print(head(data1))

# 4. Update the dataset without missing values.

sample_data<-replace_with_median(sample_data)
print("Updated sample_data:")
print(sample_data)

airquality<-replace_with_median(airquality)
print(Updated airquality dataset:)
print(airquality)

data1<-replace_with_median(data1)
print("Updated data1(modified mtcars dataset:")
print(data1)

# 5. Conclude(pack) the function into a package + documentation + help + description
install.packages("usethis")
library(usethis)
usethis::create_package("usethis")

# Function to detect missing values in a dataset
detect_missing_values <- function(data) {
  missing_counts <- colSums(is.na(data))
  missing_counts <- missing_counts[missing_counts > 0]
  return(missing_counts)
}

# Function to calculate the median for each variable
calculate_median <- function(data) {
  medians <- numeric(0)
  for (col_name in colnames(data)) {
    if (is.numeric(data[[col_name]])) {
      medians[col_name] <- median(data[[col_name]], na.rm = TRUE)
    } else {
      cat(paste("Skipping non-numeric column:", col_name, "\n"))
    }
  }
  return(medians)
}

# Function to replace missing values with median values
replace_with_median <- function(data) {
  for (col_name in colnames(data)) {
    if (is.numeric(data[[col_name]])) {
      col_median <- median(data[[col_name]], na.rm = TRUE)
      data[[col_name]][is.na(data[[col_name]])] <- col_median
    } else {
      cat(paste("Skipping non-numeric column:", col_name, "\n"))
    }
  }
  return(data)
}

detect_missing_values <- function(data) {
  missing_counts <- colSums(is.na(data))
  missing_counts <- missing_counts[missing_counts > 0]
  return(missing_counts)
}

calculate_median <- function(data) {
  medians <- numeric(0)
  for (col_name in colnames(data)) {
    if (is.numeric(data[[col_name]])) {
      medians[col_name] <- median(data[[col_name]], na.rm = TRUE)
    } else {
      cat(paste("Skipping non-numeric column:", col_name, "\n"))
    }
  }
  return(medians)
}

replace_with_median <- function(data) {
  for (col_name in colnames(data)) {
    if (is.numeric(data[[col_name]])) {
      col_median <- median(data[[col_name]], na.rm = TRUE)
      data[[col_name]][is.na(data[[col_name]])] <- col_median
    } else {
      cat(paste("Skipping non-numeric column:", col_name, "\n"))
    }
  }
  return(data)
}

library(devtools)
library(roxygen2)
setwd("usethis")
document()

setwd("usethis")
build()
install()

library(MissingValueHandler)
sample_data <- data.frame(A = c(1, 2, NA, 4, 5), B = c(NA, 2, 3, 4, 5), C = c(1, 2, 3, 4, 5))
detect_missing_values(sample_data)
calculate_median(sample_data)
replace_with_median(sample_data)

