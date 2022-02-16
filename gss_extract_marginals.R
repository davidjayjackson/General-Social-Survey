library(tidyverse)
library(stringr)
library(gssr)
library(DBI)
library(odbc)


rm(list = ls())
data(gss_all) # suvery data
data(gss_doc) # code book

con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "GSS", 
                      Trusted_Connection = "True")

## Frist two columns in code book (gss_doc) :
## (1) id (columns/var names), (2) description of var.
## In code book (gss_doc) description column for word "sports"
## Return variable/column(id) names from gss_doc
gss_education <-
  gss_doc %>% filter(str_detect(string = description, pattern = "school")) 

## Pass list of column/variable name to select statement.
## Use gss_sport to crete list of columns name for select statement.




## Party ID
 party_time <- gss_all %>% select(year,id,race,sex,partyid,educ,homesch)
 
 educ_home <- gss_get_marginals(varnames ="homesch",data = gss_doc,margin = marginals) %>%
    filter(!label %in% c("Total","DK","IAP")) 

 dbWriteTable(con, "educ_politics",party_time ,overwrite=TRUE)
 dbWriteTable(con, "political_party",gss_vars ,overwrite=TRUE)
 