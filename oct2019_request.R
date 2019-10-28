##################### BSA Consulting - USA Hockey Oct. 2019 Request #####################
# These questions are specific to North Carolina and South Carolina. 
##### Set working directory to source file location (insert yours below) #####
setwd("~/Desktop/BSA/Consulting/USA Hockey/1920/Scripts")

##### Load necessary libararies #####
library(tidyverse); library(data.table); library(lubridate)

##### Run prepare_data.R script #####
source("prepare_data.R")
# Keep only players in North Carolina and South Carolina
mdf <- mdf %>% filter(Player,State %in% c("NC","SC"))

############### Question 1 ###############
# Report registrations by birth year for each year 2014-2018.
# Also, registrations by age groups: <= 6, 7-10, 11-14, 15-18, 19-25, 26-34, 35-50, 51-65, 65+
# Example code
mdf %>% mutate(BDate=as_date(BDate),BYear=year(BDate)) %>%
  group_by(State,YearRef,BYear) %>% 
  summarize(count=n()) %>% arrange(-count)
# Tip(s): Write function to assign age group, include increase/decrease from previous year

############### Question 2 ###############
# Report registrations by gender / race for each year 2014-2018.
# Example code
mdf %>% group_by(State,YearRef,Race) %>% 
  summarize(count=n()) %>% arrange(-count)
# Tip(s): Pretty straightforward, include increase/decrease from previous year

############### Question 3 ###############
# Correlations between registration, income, race by ZIP code.
# Joey will take this one.

############### Question 4 ###############
# Questions 1 and 2 but add state / zip code group. Geographically, where are we
# gaining/losing the most players?
# Tip(s): Use raw numbers and also calculate percent change from previous year. Identify
# places of drastic increase or decrease from 2014-2018.

############### Question 5 ###############
# Effect of racial and gender diversity on growth and retention. Are zip codes where
# there is more diversity losing or gaining players in recent years?

############### Question 6 ###############
# If we want to retain players, at what age should we make sure they keep playing?
# Joey will take this one.

############### Question 7 ###############
# Best weekends or time of season to hold coaching clinics. And the location?
# Need course registration data for NC/SC.


############### CONCERNS ###############
# The data is not perfect. Years are defined by arbitrary cutoff May 1 - April 30.
# The further back you go, the more race information is missing. This makes it nearly 
# impossible to compare different years. We are assuming the distribution of missing 
# values is random, although this is almost certainly false.
