#' Return the match_api_id for all matches featuring a particular player
#'
#' @param player_api_id
#' @return A vector of all the `match_api_id`s where the player has featured
#' @examples
#' player_to_match(30981) # All Lionel Messi's matches
player_to_match <- function(player_api_id) {
  home <- football_match[
    home_player_1 == player_api_id |
      home_player_2 == player_api_id |
      home_player_3 == player_api_id |
      home_player_4 == player_api_id |
      home_player_5 == player_api_id |
      home_player_6 == player_api_id |
      home_player_7 == player_api_id |
      home_player_8 == player_api_id |
      home_player_9 == player_api_id |
      home_player_10 == player_api_id |
      home_player_11 == player_api_id,
    .(match_api_id, date, home_away = "home")
    ]

  away <- football_match[
    away_player_1 == player_api_id |
      away_player_2 == player_api_id |
      away_player_3 == player_api_id |
      away_player_4 == player_api_id |
      away_player_5 == player_api_id |
      away_player_6 == player_api_id |
      away_player_7 == player_api_id |
      away_player_8 == player_api_id |
      away_player_9 == player_api_id |
      away_player_10 == player_api_id |
      away_player_11 == player_api_id,
    .(match_api_id, date, home_away = "away")
    ]

  rbindlist(list(home, away))
}


player_to_match(30981)
