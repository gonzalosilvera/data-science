# Import libraries
library(readr)
library(ggplot2)

# Vaccination events data source
url <- "vaccination_events.csv"

# Vaccination events dataframe
vaccination_events <- read_delim(
  url,
  delim = ";",
  escape_double = FALSE,
  col_types = cols(Fecha = col_date(format = "%d/%m/%Y")),
  trim_ws = TRUE
)

# Total vaccination doses by type
total_events = c(sum(vaccination_events[, 4:5]),
                 sum(vaccination_events[, 6:7]),
                 sum(vaccination_events[, 8:9]))

# Vaccination event relative frequencies
frel_events = data.frame(
  "type" = c("Sinovac", "Pfizer", "Astrazeneca"),
  "events" = prop.table(total_events)
)

#create pie chart
ggplot(frel_events, aes(x = "", y = events, fill = type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  geom_text(aes(
    x = 1.7,
    label = scales::percent(events, accuracy = .01)
  ),
  position = position_stack(vjust = .5)) +
  labs(x = NULL, y = NULL) +
  labs(fill = "Type") +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank()
  ) +
  scale_fill_brewer()

# Vaccination events sorted by date
vaccination_events = vaccination_events[order(vaccination_events$Fecha), ]

# Date format
month = format(vaccination_events$Fecha, "%m")

# Sinovac doses summation
Sinovac = rowSums(vaccination_events[, 4:5])

# Pfizer doses summation
Pfizer = rowSums(vaccination_events[, 6:7])

# Astrazeneca doses summation
Astrazeneca = rowSums(vaccination_events[, 8:9])

# Vaccination events by type per month
events_type_month = data.frame(month, Sinovac, Pfizer, Astrazeneca)

# Group events per month
events_type = aggregate(events_type_month[, 2:4],
                        by = list(month),
                        FUN = sum)

# Months label
months = c("February", "March", "April", "May", "June", "July", "August")

# Events per month dataframe
events_month <- data.frame(
  Month = months,
  events_type[2:4]
)

# Reshape the data into long format
events_month_long <- reshape(
  events_month,
  varying = list(c("Sinovac", "Pfizer", "Astrazeneca")),
  v.names = "Count",
  times = c("Sinovac", "Pfizer", "Astrazeneca"),
  timevar = "Vaccine",
  direction = "long"
)

# Convert "Month" column to factor with desired order
events_month_long$Month <- factor(events_month_long$Month, levels = months)

# Plot the barplot
ggplot(events_month_long, aes(x = Month, y = Count, fill = Vaccine)) +
  geom_bar(stat = "identity") +
  labs(fill = "Type") +
  theme(
    axis.title = element_blank(),
    axis.line = element_blank(),
    panel.grid = element_blank(),
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent')
  ) +
  scale_fill_brewer()
