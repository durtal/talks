#===============================================================================
#                   RETRIEVE DATA FOR ATP TENNIS PLAYERS                       #
#===============================================================================

# LIBRARIES
# make sure they are installed
# install.packages('rvest')
library(jsonlite)

# data from players can be collected from their player pages on www.atpworldtour.com

# may require finding the players url, this can be retrieve by entering the players
# name into the search bar, or at the end of the url below, with andy murray as an example
# 'http://www.atpworldtour.com/-/ajax/playersearch/PlayerUrlSearch?SearchTerm=andy murray'