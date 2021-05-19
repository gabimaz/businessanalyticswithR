#Import Data
mydata=read.csv("Gig.csv")
#Number of observations
dim(mydata)
head(mydata)
View(mydata)

#Finding Missing values
is.na(mydata)
is.na(mydata$Industry)
mydata[24,]
mydata[24,3]

#Number of employees in specific categories
length(which(mydata$Industry=="Automotive"))
length(which(mydata$HourlyWage>30))
length(which(mydata$Industry=='Automotive' & mydata$HourlyWage>30))

#Sorting the data
sorteddata1=mydata[order(mydata$HourlyWage),]
View(sorteddata1)
sorteddata1=mydata[order(mydata$HourlyWage, decreasing=TRUE),]
View(sorteddata1)

sorteddata2=mydata[order(mydata$Industry, mydata$Job, mydata$HourlyWage),]
View(sorteddata2)

sorteddata2=mydata[order(mydata$Industry, mydata$Job, -mydata$HourlyWage),]
View(sorteddata2)

sorteddata3=mydata[order(-xtfrm(mydata$Industry), mydata$Job, mydata$HourlyWage),]
View(sorteddata3)

sorteddata4=mydata[order(mydata$Industry, mydata$Job, mydata$HourlyWage, decreasing = TRUE),]
View(sorteddata4)

#Exporting the data
write.csv(sorteddata4, "sorteddata4.csv")
