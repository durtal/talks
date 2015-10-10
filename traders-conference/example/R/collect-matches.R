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
library(dplyr)

setwd("c:\\Users\\TomHeslop\\Documents\\GitHub\\talks\\traders-conference\\example")

#===============================================================================
#   COLLECT TOURNAMENTS
#===============================================================================
tourneys <- read.csv("data/tournaments.csv", stringsAsFactors = FALSE)
tourneys$start_date <- as.Date(tourneys$start_date)
tourneys$end_date <- as.Date(tourneys$end_date)

current_tourneys <- subset(tourneys,
                           start_date <= Sys.Date() &
                           end_date >= Sys.Date())

matches <- readRDS("data/matches.RDS")

for(tourney in 1:nrow(current_tourneys)) {

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

    atp <- page %>%
        html_nodes(".day-table-button") %>%
        html_text() %>%
        str_replace_all("[[:cntrl:]]", " ") %>%
        str_trim(side = "both")

    tmp <- data.frame(name = current_tourneys$name[ind],
                      venue = current_tourneys$venue[ind],
                      tourney_dates = current_tourneys$date[ind],
                      surface = current_tourneys$surface[ind],
                      date = Sys.Date(),
                      rd = rd,
                      playerA = playerA,
                      playerB = playerB,
                      atp = atp,
                      stringsAsFactors = FALSE)

    tmp <- tmp %>%
        filter(grepl("H2H", atp))

    today_matches <- plyr::rbind.fill(matches, tmp)
    today_matches <- matches[!duplicated(matches),]
}

matches <- plyr::rbind.fill(matches, today_matches)
matches <- matches[!duplicated(matches),]
saveRDS(matches, "data/matches.RDS")
