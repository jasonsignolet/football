#' Return the match_api_id for all matches starting a particular player
#'
#' @param player_api_id The `player_api_id` from the `player` dataset.
#' @export
#' @import data.table
#' @return A data.table of all the matches where the player started.
#'   Columns are:
#'   \itemize{
#'     \item{match_api_id}
#'     \item{home_team_api_id}
#'     \item{away_team_api_id}
#'     \item{date: Match date}
#'     \item{at_home: (Boolean) Did the player start for the home side?}
#'   }
#' @examples
#' # All Lionel Messi's matches
#' player_to_match(30981)
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
    .(match_api_id, home_team_api_id, away_team_api_id, date, at_home = TRUE)
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
    .(match_api_id, home_team_api_id, away_team_api_id, date, at_home = FALSE)
    ]

  rbindlist(list(home, away))[order(date)]
}
