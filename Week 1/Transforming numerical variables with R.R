#Import the data
mydata=read.csv("customers.csv")

# Create Spneding Diff and Percentage spending Diff variables
mydata$SpendingDiff=mydata$Spending2018-mydata$Spending2017
head(mydata$SpendingDiff)

mydata$PctSpendingDiff=round((mydata$SpendingDiff/mydata$Spending2017)*100, digits=2)
head(mydata$PctSpendingDiff)
mydata$PctSpendingDiff=paste(mydata$PctSpendingDiff, "%")
head(mydata$PctSpendingDiff)

#Create Log(Income)
mydata$IncomeLn=log(mydata$Income)
head(mydata$IncomeLn)

#Create Age variable
mydata$BirthDate=as.Date(mydata$BirthDate, format="%m/%d/%Y")
enddate=as.Date("01/01/2019", format="%m/%d/%Y")


mydata$Age=difftime(enddate, mydata$BirthDate)/365.25

mydata$Age=as.numeric(mydata$Age)
mydata$Age=floor(mydata$Age)

#Extract the month from a date
mydata$BirthMonth=months(mydata$BirthDate)
mydata$BirthMonth=match(mydata$BirthMonth, month.name)

#Other useful date functions
week=weekdays(as.Date("2000-12-25"))
f=format(as.Date("2000-12-25"), "%Y")
Sys.Date()
Sys.time()
