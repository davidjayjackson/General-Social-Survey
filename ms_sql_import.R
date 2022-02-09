library(DBI)
library(odbc)

## https://db.rstudio.com/databases/microsoft-sql-server/
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "GSS", 
                      Trusted_Connection = "True")

dbListTables(con)

t1 <- social_survey %>% select(1:1000)


dbWriteTable(con, "t1",t1 ,overwrite=TRUE)


# dbCommit(con)