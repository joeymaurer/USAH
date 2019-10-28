######################## BSA Consulting - USA Hockey Data Script ########################
# This script will load all of the data

##### Load necessary libraries #####
library(tidyverse); library(data.table)

##### Load data #####
### mdf - Member data from last 5 years
# Read from Dropbox
mdf <- fread("https://www.dropbox.com/s/k0ioxfo1i2bsh8j/clean_md5.csv?dl=1",
             colClasses=c("numeric",rep("character",7),"numeric",rep("logical",4),rep("numeric",4)))

# Fix Race and ZIP columns
mdf$Race <- sapply(mdf$Race,function(x) {
  if(is.na(x)) return(NA) else return(paste("0",x,sep=""))
})
mdf$Zip <- sapply(mdf$Zip,function(x){substr(x,2,6)})

### snames - State names and abbreviations crosswalk
snames <- read.csv("https://www.dropbox.com/s/4n9wshsrguyqlby/snames.csv?dl=1",
                   stringsAsFactors=FALSE)

### zdf - Player and demographic information by ZIP code
zdf <- fread("https://www.dropbox.com/s/yjb1ulg55eshf6k/zdf.csv?dl=1",
                colClasses=c(rep("character",4),rep("numeric",16)))

### rnames - Codes for race
rnames <- data.frame(Code=paste0("0",1:9),
                     Race=c("Prefer not to share","American Indian/Alaska Native",
                            "Asian","Black/African American","Native Hawaiian/Pacific Islander",
                            "Hispanic/Latino","White","2+ races","Other"),
                     stringsAsFactors=FALSE)
