# Import readr library
library(readr)
# Vaccination events data source
url <- "vaccination_events.csv"
# Vaccination events dataframe
vaccination_events <- read_delim(url, delim = ";", escape_double = FALSE, col_types = cols(Fecha = col_date(format = "%d/%m/%Y")), trim_ws = TRUE)
# Display dataframe
View(vaccination_events)

# Total vaccination doses by type
total_events=c(sum(vaccination_events[,4:5]),sum(vaccination_events[,6:7]),sum(vaccination_events[,8:9]))
# Vaccination event relative fraquencies
frel_events= prop.table(total_events)
# Vaccination type colors
colors=c("coral2","cadetblue2","darkolivegreen2")
# Vaccination type labels and vaccination event percentages
labels= paste(c("Sinovac","Pfizer","Astrazeneca"),"\n",round(frel_events*100,2), "%", sep = "")
# Pie chart "Total vaccination events by type"
pie(frel_events, labels = labels, col = colors, main = "Total vaccination events by type")

# Vaccination events sorted by date
vaccination_events=vaccination_events[order(vaccination_events$Fecha),]
# Date format
month=format(vaccination_events$Fecha, "%m")
# Sinovac doses summation
Sinovac=rowSums(vaccination_events[,4:5])
# Pfizer doses summation
Pfizer=rowSums(vaccination_events[,6:7])
# Astrazeneca doses summation
Astrazeneca=rowSums(vaccination_events[,8:9])
# Vaccination events by type per month
events_type_month=data.frame(month, Sinovac, Pfizer,Astrazeneca)
# Group events per month
events_type = aggregate(events_type_month[,2:4], by=list(month), FUN = sum)
# Dataframe transposed
events_month = t(events_type[2:4])
# Months vector
months=c("February", "March", "April", "May", "June", "July", "August")
# Columns labeled
colnames(events_month)<-months
# Bar chart "Vaccination events per month"
barplot(events_month, col=colors, legend.text = c("Sinovac", "Pfizer","Astrazeneca"), main = "Vaccination events per month", ylim=c(0,1200000), ylab = "Vaccination events", xlab = "Months")
