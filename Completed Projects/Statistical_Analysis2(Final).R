# Assume that 15% of all Lipscomb Master's students commute more than 20 miles one-way to campus. 
# Also assume that you poll a class of 60 students, and that 16 of them indicate to you that they travel more than 20 miles one-way to class. 
# The probability of observing such an outcome (i.e., that 16 out of 60 travel more than 20 miles) is:
dbinom(16, 60, .15)

# What is the mean of the distribution
men = .15 * 60
men

# What is the variance of the distribution
vari = (.15 * 60) * (1 - .15)
vari

# What is the standard deviation of the distribution
st_dev = sqrt((.15 * 60) * (1 - .15))
st_dev




# Among companies doing highway or bridge construction, 
# 80% test employees for substance abuse (based on data from the Construction Financial Management Association). 
# A study to investigate this further is being conducted, and involves the random selection of 10 such companies.

# Find:

# a) the probability that exactly 5 of the 10 companies test for substance abuse.

# b) the probability that at least half of the 10 companies test for substance abuse.

# (a)
prob_a = dbinom(5, 10, .8)
prob_a
# (b)
prob_b = 1-pbinom(4, 10, .8)
prob_b



# The cost of treatment per patient for a certain medical problem was modeled by one insurance company as a...
# normal random variable with mean $775 and standard deviation $150. What is the probability that...
# the treatment cost of a patient is less than $1,000, based on this model?
prob_treat <- pnorm(1000, 775, 150)
prob_treat


# The diameters of steel disks produced in a plant are normally distributed with a mean of 2.5 cm and standard deviation of .02 cm. 
# The probability that a disk picked at random has a diameter greater than 2.54 cm is about:
prob_disk <- 1-pnorm(2.54, 2.5, .02)
prob_disk


# The time that a skier takes on a downhill course has a normal distribution with a mean of 12.3 minutes and standard deviation of 0.4 minutes. 
# The probability that on a random run the skier takes between 12.1 and 12.5 minutes is:
prob_ski <- pnorm(12.5, 12.3, 0.4)-pnorm(12.1, 12.3, 0.4)
prob_ski


# An advertising firm, interested in determining how much to emphasize television advertising in a certain county..
# decides to conduct a sample survey to estimate the average number of hours each week that households within that county watch television. 
# The county has two towns, A and B, and a rural area C. Town A is built around a factory and most households contain...
# factory workers with school-aged children, Town B contains mainly retirees, and the rural area C are mainly farmers. 
# There are 155 households in town A, 62 in town B and 93 in the rural area, C. 
# The firm decides to randomly select 20 households from Town A, 8 households from Town B and 12 households from the rural area.
# What type of sampling method does this describe?

# *Answer = Stratified Sampling