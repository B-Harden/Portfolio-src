library(dplyr)
library(MASS)
library(ggplot2)

# Explore data 
head(MASS::Cars93)
str(MASS::Cars93)
dim(Cars93)

# Calculate Percentage of Cylinders
cyl_summary <- Cars93 %>%
  group_by(Cylinders)%>%
  summarise( count_c = n(),
             pct_count = count_c / 93 *100)
(cyl_summary)


# Plot the frequency of Cars per Cylinder
ggplot(cyl_summary, aes(x = cyl_summary$Cylinders, y = cyl_summary$pct_count)) +
  geom_bar(stat = "identity") +
  labs(x = "Number of Cylinders", y = "Frequency", title= "Percentage of Cars per Cylinder Configuration")
