## European professional football data ----
##
## Jason Signolet, 2017-10-10
##
## Data downloaded from https://www.kaggle.com/hugomathien/soccer
##
##

library(RSQLite)
library(data.table)
library(ggplot2)

## Connect to the SQLite serverless DB and show the tables ----
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "data/soccer.sqlite")
table_names <- dbListTables(con)
print(table_names)

## Summarise all of the available tables ----
for (table_name in table_names) {
  cat(table_name)
  cat("\n")
  print(dbGetQuery(con, sprintf("SELECT count(*) FROM %s", table_name)))
  print(str(dbGetQuery(con, sprintf("SELECT * FROM %s LIMIT 10", table_name))))
  cat("\n")
}

## Be sure to close the connection when you're done ----
dbDisconnect(con)
