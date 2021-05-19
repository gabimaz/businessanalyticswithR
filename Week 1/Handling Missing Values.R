#Import Data
mydata=read.csv("restaurant_reviews.csv")

#Identfying Missing Values
is.na(mydata)
is.na(mydata$Service)
mydata[complete.cases(mydata),]
mydata[!complete.cases(mydata),]

#Handling Missing Values with Omission Strategy
omissionData=na.omit(mydata)

#Handling Missing Values with Mean Imputation
ambienceMean=mean(mydata$Ambience, na.rm=TRUE)
serviceMean=mean(mydata$Service, na.rm=TRUE)

mydata$Ambience[is.na(mydata$Ambience)]=ambienceMean
mydata$Service[is.na(mydata$Service)]=serviceMean
