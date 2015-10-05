#===============================================================================
#                   RETRIEVE DATA FOR TOURNAMENT MATCHES                       #
#  see durtal.github.io/talks/traders-conference/example/data-collection.html  #
#===============================================================================

# LIBRARIES
# make sure they are installed
# install.packages('rvest')
library(rvest)
library(jsonlite)
library(stringr)

#===============================================================================
#   COLLECT TOURNAMENTS
#===============================================================================
tourneys <- read.csv("C:\\Users\\TomHeslop\\Documents\\GitHub\\talks\\traders-conference\\example\\data\\tournaments.csv", stringsAsFactors = FALSE)
tourneys$start_date <- as.Date(tourneys$start_date)
tourneys$end_date <- as.Date(tourneys$end_date)

current_tourneys <- subset(tourneys,
                           start_date <= Sys.Date() &
                           end_date >= Sys.Date())

for(tourney in 1:length(current_tourneys$name)) {

    ind <- tourney
    cat("\n\n\nCollecting Matches for ATP", current_tourneys$name[ind], "tournament\n\n\n")

    url <- paste0("http://www.atpworldtour.com", current_tourneys$link[ind])
    url <- gsub("overview", "daily-schedule", url)
    url <- gsub("tournaments", "scores/current", url)

    cat(url)

    page <- html(url)

    rd <- page %>%
        html_nodes(".day-table-round") %>%
        html_text() %>%
        str_replace_all("[[:cntrl:]]", " ") %>%
        str_trim(side = "both")

    playerA <- page %>%
        html_nodes(".day-table-name:nth-child(4)") %>%
        html_text() %>%
        str_replace_all("[[:cntrl:]]", " ") %>%
        str_trim(side = "both")

    playerB <- page %>%
        html_nodes(".day-table-name:nth-child(8)") %>%
        html_text() %>%
        str_replace_all("[[:cntrl:]]", " ") %>%
        str_trim(side = "both")

    tmp <- data.frame(rd = rd,
                      playerA = playerA,
                      playerB = playerB,
                      stringsAsFactors = FALSE)

    cat("\n\n\n")
    print(tmp, row.names = FALSE)
    cat("\n\n\n")

}
