#===============================================================================
#                   RETRIEVE DATA FOR ATP TOURNAMENTS                          #
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
tourney_page <- html("http://www.atpworldtour.com/en/tournaments")

tourney <- tourney_page %>%
    html_nodes(".tourney-title") %>%
    html_text()

tourney_link <- tourney_page %>%
    html_nodes(".tourney-title") %>%
    html_attr("href")

tourney_location <- tourney_page %>%
    html_nodes(".tourney-location") %>%
    html_text() %>%
    str_replace_all("[[:cntrl:]]", "")

tourney_date <- tourney_page %>%
    html_nodes(".tourney-dates") %>%
    html_text() %>%
    str_replace_all("[[:cntrl:]]", "")

tourney_surface <- tourney_page %>%
    html_nodes(".tourney-details:nth-child(2) .item-details") %>%
    html_text() %>%
    str_replace_all("[[:cntrl:]]", "")

tourneys <- data.frame(name = tourney,
                       link = tourney_link,
                       venue = tourney_location,
                       date = tourney_date,
                       surface = tourney_surface,
                       stringsAsFactors = FALSE)

# add tournament start and end dates
tourneys$start_date <- as.Date(str_extract(string = tourneys$date,
                                           pattern = "^[[:digit:]]{4}\\.[[:digit:]]{2}\\.[[:digit:]]{2}"),
                               format = "%Y.%m.%d")
tourneys$end_date <- as.Date(str_extract(string = tourneys$date,
                                         pattern = "[[:digit:]]{4}\\.[[:digit:]]{2}\\.[[:digit:]]{2}$"),
                             format = "%Y.%m.%d")

old_tourneys <- read.csv("data/tournaments.csv", stringsAsFactors = FALSE)

tourneys <- plyr::rbind.fill(old_tourneys, tourneys)

tourneys <- tourneys[!duplicated(tourneys),]

write.csv(tourneys, file = "data/tournaments.csv", row.names = FALSE)
