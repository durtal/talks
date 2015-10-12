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

source("R/functions.R")

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

        playerA_stats <- get_player_stats(player = matches$playerA[tennis_match])

        outlist[[tennis_match]]$pA <- playerA_stats[2, 3]
        outlist[[tennis_match]]$firstServeA <- playerA_stats[1, 3]
        outlist[[tennis_match]]$p2A <- playerA_stats[3, 3]

        playerB_stats <- get_player_stats(player = matches$playerB[tennis_match])

        outlist[[tennis_match]]$pB <- playerB_stats[2, 3]
        outlist[[tennis_match]]$firstServeB <- playerB_stats[1, 3]
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
