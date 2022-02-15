library(tidyverse)
library(stringr)
library(gssr)


rm(list = ls())
data(gss_all) # suvery data
data(gss_doc) # code book

## Frist two columns in code book (gss_doc) :
## (1) id (columns/var names), (2) description of var.
## In code book (gss_doc) description column for word "sports"
## Return variable/column(id) names from gss_doc
gss_sports <-
  gss_doc %>% filter(str_detect(string = description, pattern = "sports")) %>% select(id)

## Pass list of column/variable name to select statement.
## Use gss_sport to crete list of columns name for select statement.

sports_list <- gss_all %>% select(year,id,dosports,
                   sports30,
                   typsport,
                   numsport,
                   yrsport1,
                   yrsport2,
                   yrsport3,
                   yrsport4,
                   yrsport5,
                   yrsport6,
                   grpsprts,
                   grpsport,
                   amsports,
                   proudspt,
                   natactive)

summary(sports_list)




