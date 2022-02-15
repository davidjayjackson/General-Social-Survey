library(DBI)
library(odbc)
library(tidyverse)
library(gssr)
## Install GSSR Package
# remotes::install_github("kjhealy/gssr")

## https://db.rstudio.com/databases/microsoft-sql-server/
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "GSS", 
                      Trusted_Connection = "True")

## Load GSS Docs

data(gss_doc)
gss_toc <- gss_doc %>% select(id,description)
dbWriteTable(con, "gss_toc",gss_toc ,overwrite=TRUE)

# survey_long <- social_survey %>% pivot_longer(cols = WRKSTAT:SPOCCINDV)

## Begin Building table for import to SQL Server

t1 <- social_survey %>% select(1:1000)
dbWriteTable(con, "t1",t1 ,overwrite=TRUE)



## Break down Survey into tabl of 1000 columns (+2)
t2 <- social_survey %>% select(YEAR,ID,1001:2000)
dbWriteTable(con, "t2",t2 ,overwrite=TRUE)
##

t3 <- social_survey %>% select(YEAR,ID,2001:3000)
dbWriteTable(con, "t3",t3 ,overwrite=TRUE)
##
t4 <- social_survey %>% select(YEAR,ID,3000:3999)
dbWriteTable(con, "t4",t4 ,overwrite=TRUE)
##
t5 <- social_survey %>% select(YEAR,ID,4000:4999)
dbWriteTable(con, "t5",t5 ,overwrite=TRUE)
##
t6 <- social_survey %>% select(YEAR,ID,5000:5999)
dbWriteTable(con, "t6",t6 ,overwrite=TRUE)
##
t7 <- social_survey %>% select(YEAR,ID,6000:6110)
dbWriteTable(con, "t7",t7 ,overwrite=TRUE)
##
