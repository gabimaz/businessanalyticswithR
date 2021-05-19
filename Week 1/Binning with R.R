#Import the data
mydata=read.csv("customers.csv")

#Create Bins for Recency, Frequency, Monetary
mydata$DaysSinceLastReverse=as.numeric(mydata$DaysSinceLast*-1)
recencyBins=quantile(mydata$DaysSinceLastReverse, prob=seq(0, 1, by=0.2))
recencyBins

frequencyBins=quantile(mydata$NumOfOrders, prob=seq(0, 1, by=0.2))
frequencyBins

monetaryBins=quantile(mydata$Spending2018, prob=seq(0, 1, by=0.2))
monetaryBins

#Bin and assign numbers for each bin from 1 to 5
mydata$Recency=cut(mydata$DaysSinceLastReverse, breaks=recencyBins, labels=c("1", "2", "3", "4", "5"),
                   include.lowest = TRUE, right=FALSE)

mydata$Frequency=cut(mydata$NumOfOrders, breaks=frequencyBins, labels=c("1", "2", "3", "4", "5"),
                   include.lowest = TRUE, right=FALSE)

mydata$Monetary=cut(mydata$Spending2018, breaks=monetaryBins, labels=c("1", "2", "3", "4", "5"),
                     include.lowest = TRUE, right=FALSE)
#Create RFM
mydata$RFM=paste(mydata$Recency, mydata$Frequency, mydata$Monetary)

head(mydata$RFM)

#Bin Income
mydata$BinnedIncome=cut(mydata$Income, breaks=5, labels=c("1", "2", "3", "4", "5"), 
                        include.lowest = TRUE, right=FALSE)

levels(cut(mydata$Income, breaks=5))

table(mydata$BinnedIncome)

#Create Membership Tiers
mydata$MembershipTier=cut(mydata$Spending2018, breaks=c(0, 250, 1000, Inf), 
                          labels=c("Bronze", "Silver", "Gold"))
