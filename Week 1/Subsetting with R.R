#Importing the data
mydata=read.csv("customers.csv")

#Subsetting college educated survey takers
college=mydata[mydata$College=="Yes",]

#Subsetting college educated millenials
college$BirthDate=as.Date(college$BirthDate, format="%m/%d/%Y")

cutoffdate1=as.Date("01/01/1981", format="%m/%d/%Y")
cutoffdate2=as.Date("12/31/1999", format="%m/%d/%Y")

millenials=college[college$BirthDate>=cutoffdate1 & college$BirthDate<=cutoffdate2,]

#subsetting with selected columns
subset1=millenials[, c(2,6,8,10,11,14)]
subset2=millenials[,c("Sex", "HouseholdSize", "Income", "Spending2018", "NumOfOrders", "Channel")]

#Converting text to categorical data
subset1$Sex=as.factor(subset1$Sex)
subset1$Channel=as.factor(subset1$Channel)
is.factor(subset1$Channel)

#Splitting the dataset into two groups:Female and Male
sex=split(subset1, subset1$Sex)
sex$Female
sex$Male

dataRanges=mydata[c(1:50, 101:200),]
