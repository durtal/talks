#===============================================================================
#                   RETRIEVE DATA FOR PLAYERS, PREDICT MATCH                   #
#  see durtal.github.io/talks/traders-conference/example/servevolleyR.html     #
#===============================================================================

# LIBRARIES
# make sure they are installed
# install.packages('dplyr')
library(dplyr)
library(jsonlite)
library(rvest)
library(stringr)
library(servevolleyR)

setwd("c:\\Users\\TomHeslop\\Documents\\GitHub\\talks\\traders-conference\\example")

#===============================================================================
#   RETRIEVE MATCHES
#===============================================================================
matches <- readRDS("data/matches.RDS")
match_stats <- readRDS("data/match_stats.RDS")

matches <- subset(matches, date == Sys.Date())

base_url <- "http://www.atpworldtour.com"
player_search <- paste0(base_url, "/-/ajax/playersearch/PlayerUrlSearch?SearchTerm=")

outlist <- vector("list", nrow(matches))

if(length(matches$name) > 0) {
    for(tennis_match in 1:nrow(matches)) {

        outlist[[tennis_match]] <- list(name = matches$name[tennis_match],
                                        venue = matches$venue[tennis_match],
                                        tourney_dates = matches$tourney_dates[tennis_match],
                                        surface = matches$surface[tennis_match],
                                        date = matches$date[tennis_match],
                                        rd = matches$rd[tennis_match],
                                        playerA = matches$playerA[tennis_match],
                                        playerB = matches$playerB[tennis_match])

        playerA <- fromJSON(paste0(player_search, matches$playerA[tennis_match]))
        playerA <- playerA$items
        playerA <- playerA$Value[grepl(matches$playerA[tennis_match], playerA$Key)]
        playerA <- paste0(base_url, playerA)
        playerA <- gsub("overview", "player-stats", playerA)

        playerA_page <- html(playerA)
        playerA_stats <- playerA_page %>%
            html_table() %>%
            .[[1]]
        names(playerA_stats) <- c("stat", "value")
        playerA_stats <- playerA_stats %>%
            filter(grepl("1st Serve|2nd Serve", stat)) %>%
            mutate(new_value = str_replace(value, "[[:punct:]]", ""),
                   new_value = as.numeric(new_value) / 100)
        outlist[[tennis_match]]$pA <- playerA_stats[2, 3]
        outlist[[tennis_match]]$firstServeA <- playerA_stats[1, 3]
        outlist[[tennis_match]]$p2A <- playerA_stats[3, 3]

        playerB <- fromJSON(paste0(player_search, matches$playerB[tennis_match]))
        playerB <- playerB$items
        playerB <- playerB$Value[grepl(matches$playerB[tennis_match], playerB$Key)]
        playerB <- paste0(base_url, playerB)
        playerB <- gsub("overview", "player-stats", playerB)

        playerB_page <- html(playerB)
        playerB_stats <- playerB_page %>%
            html_table() %>%
            .[[1]]
        names(playerB_stats) <- c("stat", "value")
        playerB_stats <- playerB_stats %>%
            filter(grepl("1st Serve|2nd Serve", stat)) %>%
            mutate(new_value = str_replace(value, "[[:punct:]]", ""),
                   new_value = as.numeric(new_value) / 100)
        outlist[[tennis_match]]$pB <- playerA_stats[2, 3]
        outlist[[tennis_match]]$firstServeB <- playerA_stats[1, 3]
        outlist[[tennis_match]]$p2B <- playerB_stats[3, 3]

        winA <- replicate(1e3, simMatch(pA = outlist[[tennis_match]]$pA,
                                        p2A = outlist[[tennis_match]]$p2A,
                                        firstServeA = outlist[[tennis_match]]$firstServeA,
                                        pB = outlist[[tennis_match]]$pB,
                                        p2B = outlist[[tennis_match]]$p2B,
                                        firstServeB = outlist[[tennis_match]]$firstServeB,
                                        sets = 5, tiebreaks = TRUE, finalSetTiebreak = TRUE))
        outlist[[tennis_match]]$winA <- ((table(winA) / sum(table(winA)))[[2]])

    }

    outdf <- plyr::ldply(outlist, data.frame, stringsAsFactors = FALSE)
    match_stats <- plyr::rbind.fill(match_stats, outdf)
    match_stats <- match_stats %>%
        distinct(name, venue, tourney_dates, surface, date, rd, playerA, playerB)
    saveRDS(match_stats, "data/match_stats.RDS")
}