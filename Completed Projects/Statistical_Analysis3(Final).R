# When a poultry farmer uses his regular feed, the newborn chickens have normally distributed weights with a mean of 62.2 oz. 
# In an experiment with an enriched feed mixture, nine chickens are born with the weights (in ounces) given below:

# 61.4   62.2   66.9   63.3   66.2   66.0   63.1   63.7   66.6

# Using this data, determine the probability of observing a sample mean as large or larger as you do from this sample, given the expected mean of 62.2 oz.
prob_feed = 1 - pt(2.83, df = 20)
prob_feed


# A gasoline company tested 20 samples of gasoline produced during a day to check whether the day's production meets the nominal octane rating of 87. 
# conduct a hypothesis test to determine if the mean octane rating of the company's gasoline is different than 87.
octane.df <- data.frame("octane" = c(87.5,86.9,86.6,87.3,87.9,88.0,86.7,87.5,87.2,87.0,88.1
                                     ,87.5,86.5,87.7,88.0,87.1,87.0,87.6,87.5,88.3))

t.test(x= octane.df, mu = 87)
# Answer= Reject Ho


# Researchers interested in lead exposure due to car exhaust sampled the blood of 52 police officers subjected to constant inhalation...
# of automobile exhaust fumes while working traffic enforcement in a primarily urban environment.
# The blood samples of these officers had an average lead concentration of 39.4 ??g/l and a SD of 11.2 ??g/l;
# a previous study of individuals from a nearby suburb, with no history of exposure, found an average blood level concentration of 35 ??g/l.
# est the hypothesis (at a 5% level of significance) that the police officers have been exposed to a higher concentration of lead. 
# Report the t statistic, the p-value, and your conclusion.
prob_lead = 1 - pt(2.83, df = 20)
prob_lead
# Answer= Reject Ho