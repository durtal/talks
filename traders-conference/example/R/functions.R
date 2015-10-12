get_player_stats <- function(player) {

    base_url <- "http://www.atpworldtour.com"
    player_search <- paste0(base_url, "/-/ajax/playersearch/PlayerUrlSearch?SearchTerm=")

    player_results <- jsonlite::fromJSON(paste0(player_search, player))

    player_results <- player_results$items$Value[grepl(player, player_results$items$Key, ignore.case = TRUE)]

    player_url <- paste0(base_url, player_results)
    player_url <- gsub("overview", "player-stats", player_url)

    player_page <- rvest::html(player_url)
    player_stats <- player_page %>%
        html_table() %>%
        .[[1]]

    names(player_stats) <- c("stat", "value")
    player_stats <- player_stats %>%
        filter(grepl("1st Serve|2nd Serve", stat)) %>%
        mutate(new_value = str_replace(value, "[[:punct:]]", ""),
               new_value = as.numeric(new_value) / 100)
    return(player_stats)
}