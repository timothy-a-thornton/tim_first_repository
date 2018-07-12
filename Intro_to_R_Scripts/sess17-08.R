# Session 8

#install.packages("ggplot2") # WA1 is at the Hutch (on Eastlake, in Seattle)
install.packages("ggplot2")
library("ggplot2")

# get the data
salary <- read.table("http://faculty.washington.edu/kenrice/rintro/salary.txt", header=TRUE)

# examples provided

qplot(salary, geom="density", fill=gender, data=salary,
 xlab="Monthly Salary", ylab="Density")

qplot(salary, geom="density", fill=gender, data=salary,
 xlab="Monthly Salary", ylab="Density", alpha=0.5)

#Q2

qplot(salary, geom="density", fill=rank, data=salary,
 xlab="Monthly Salary", ylab="Density", alpha=0.5)
#na=gray... nicer to omit these

is.missing <- is.na(salary$salary) | is.na(salary$rank)
salary2 <- salary[!is.missing ,]
qplot(salary, geom="density", fill=rank, data=salary2,
 xlab="Monthly Salary", ylab="Density", alpha=0.5)

#Q3

qplot(salary, geom="histogram", data=salary2,
 xlab="Monthly Salary", ylab="Density", alpha=0.5)

qplot(salary, geom="histogram", fill=rank, data=salary2,
 xlab="Monthly Salary", ylab="Density", alpha=0.5)

# within rank - first approach uses interaction
qplot(salary, geom="histogram", fill=interaction(rank,gender), data=salary2,
 xlab="Monthly Salary", ylab="Density", alpha=0.5)

# slightly more sophisticated, after qplot() can add a 'facet' 
qplot(salary, geom="histogram", fill=gender, data=salary2,
 xlab="Monthly Salary", ylab="Density", alpha=0.5) + facet_wrap(~ rank)

qplot(salary, geom="density", fill=gender, data=salary2,
      xlab="Monthly Salary", ylab="Density", alpha=0.5) + facet_wrap(~ rank)


# note non-standard syntax; qplot( outcome , data, fill etc + facet

# Q4 - example first

ggplot(data=salary2, aes(x = rank, y = salary, fill = gender)
 ) + geom_boxplot()

ggplot(data=salary2, aes(x = rank, y = salary, fill = gender)
 ) + geom_boxplot() + facet_wrap(~field)

# be patient!

ggplot(data=salary2, aes(x = factor(startyr), y = salary, fill = gender)
 ) + geom_boxplot() + facet_wrap(~rank)

ggplot(data=salary2, aes(x = factor(startyr), y = salary)
 ) + geom_boxplot() + facet_wrap(~gender + rank)

ggplot(data=salary2, aes(x = factor(startyr), y = salary, fill = gender)
 ) + geom_boxplot() + facet_wrap(~rank + field)

ggplot(data=salary2, aes(x = startyr, y = salary, fill = gender )
 ) + geom_point(shape=1) + facet_wrap(~rank + field)

