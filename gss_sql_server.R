## Created 2022-06-24


library(tidyverse)
library(gssr)
library(DBI)
library(odbc)
library(stringr)


rm(list = ls())

## https://db.rstudio.com/databases/microsoft-sql-server/
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "GSS", 
                      Trusted_Connection = "True")

data(gss_all) # survey data
data(gss_doc) # code book

df <- gss_all %>% select(year,id,race,race1,racesee,raceself,sex,age,educ,partyid,agewed,region,relig,jew,conpresy)
dbWriteTable(con, "survey",df ,overwrite=TRUE)

questions <- c("race","race1","racesee","raceself","sex","partyid","region","relig","jew","conpresy")
lookup <- gss_get_marginals(varnames = questions, data = gss_doc, margin = marginals)

lookup <- lookup %>% select(variable,value,label) %>%  filter(label !="DK",label !="Total")
dbWriteTable(con, "lookup",lookup ,overwrite=TRUE)

### Write to CSV

# write_csv(df,file="./survey.csv")
# write_csv(lookup,file="./lookup.csv")



