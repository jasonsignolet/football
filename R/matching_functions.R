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










#' A view to see matchday team attributes
#'
#' @export
#' @return A data.table with all the home and away team attributes.
#' @examples
#' matchday_team_attributes()
matchday_team_attributes <- function() {
  .team_attributes <- copy(team_attributes)

  output <- football_match[, .(match_api_id, match_date = date,
                               home_team_api_id, away_team_api_id)][
    .team_attributes[, assessment_date := date],
    on = c("home_team_api_id" = "team_api_id", "match_date" = "date"),
    roll = -Inf, `:=`(home_assessment = assessment_date,
                      home_buildUpPlaySpeed = buildUpPlaySpeed,
                      home_buildUpPlaySpeedClass = buildUpPlaySpeedClass,
                      home_buildUpPlayDribbling = buildUpPlayDribbling,
                      home_buildUpPlayDribblingClass = buildUpPlayDribblingClass,
                      home_buildUpPlayPassing = buildUpPlayPassing,
                      home_buildUpPlayPassingClass = buildUpPlayPassingClass,
                      home_buildUpPlayPositioningClass = buildUpPlayPositioningClass,
                      home_chanceCreationPassing = chanceCreationPassing,
                      home_chanceCreationPassingClass = chanceCreationPassingClass,
                      home_chanceCreationCrossing = chanceCreationCrossing,
                      home_chanceCreationCrossingClass = chanceCreationCrossingClass,
                      home_chanceCreationShooting = chanceCreationShooting,
                      home_chanceCreationShootingClass = chanceCreationShootingClass,
                      home_chanceCreationPositioningClass = chanceCreationPositioningClass,
                      home_defencePressure = defencePressure,
                      home_defencePressureClass = defencePressureClass,
                      home_defenceAggression = defenceAggression,
                      home_defenceAggressionClass = defenceAggressionClass,
                      home_defenceTeamWidth = defenceTeamWidth,
                      home_defenceTeamWidthClass = defenceTeamWidthClass,
                      home_defenceDefenderLineClass = defenceDefenderLineClass)
    ][
      .team_attributes[, assessment_date := date],
      on = c("home_team_api_id" = "team_api_id", "match_date" = "date"),
      roll = -Inf, `:=`(away_assessment = assessment_date,
                        away_buildUpPlaySpeed = buildUpPlaySpeed,
                        away_buildUpPlaySpeedClass = buildUpPlaySpeedClass,
                        away_buildUpPlayDribbling = buildUpPlayDribbling,
                        away_buildUpPlayDribblingClass = buildUpPlayDribblingClass,
                        away_buildUpPlayPassing = buildUpPlayPassing,
                        away_buildUpPlayPassingClass = buildUpPlayPassingClass,
                        away_buildUpPlayPositioningClass = buildUpPlayPositioningClass,
                        away_chanceCreationPassing = chanceCreationPassing,
                        away_chanceCreationPassingClass = chanceCreationPassingClass,
                        away_chanceCreationCrossing = chanceCreationCrossing,
                        away_chanceCreationCrossingClass = chanceCreationCrossingClass,
                        away_chanceCreationShooting = chanceCreationShooting,
                        away_chanceCreationShootingClass = chanceCreationShootingClass,
                        away_chanceCreationPositioningClass = chanceCreationPositioningClass,
                        away_defencePressure = defencePressure,
                        away_defencePressureClass = defencePressureClass,
                        away_defenceAggression = defenceAggression,
                        away_defenceAggressionClass = defenceAggressionClass,
                        away_defenceTeamWidth = defenceTeamWidth,
                        away_defenceTeamWidthClass = defenceTeamWidthClass,
                        away_defenceDefenderLineClass = defenceDefenderLineClass)
      ][
        !is.na(home_assessment) & !is.na(match_date),
        .(match_api_id, home_team_api_id, away_team_api_id,
          match_date, home_assessment, away_assessment,
          home_buildUpPlaySpeed, home_buildUpPlaySpeedClass,
          home_buildUpPlayDribbling, home_buildUpPlayDribblingClass,
          home_buildUpPlayPassing, home_buildUpPlayPassingClass,
          home_buildUpPlayPositioningClass, home_chanceCreationPassing,
          home_chanceCreationPassingClass, home_chanceCreationCrossing,
          home_chanceCreationCrossingClass, home_chanceCreationShooting,
          home_chanceCreationShootingClass, home_chanceCreationPositioningClass,
          home_defencePressure, home_defencePressureClass,
          home_defenceAggression, home_defenceAggressionClass,
          home_defenceTeamWidth, home_defenceTeamWidthClass,
          home_defenceDefenderLineClass, away_buildUpPlaySpeed,
          away_buildUpPlaySpeedClass, away_buildUpPlayDribbling,
          away_buildUpPlayDribblingClass, away_buildUpPlayPassing,
          away_buildUpPlayPassingClass, away_buildUpPlayPositioningClass,
          away_chanceCreationPassing, away_chanceCreationPassingClass,
          away_chanceCreationCrossing, away_chanceCreationCrossingClass,
          away_chanceCreationShooting, away_chanceCreationShootingClass,
          away_chanceCreationPositioningClass, away_defencePressure,
          away_defencePressureClass, away_defenceAggression,
          away_defenceAggressionClass, away_defenceTeamWidth,
          away_defenceTeamWidthClass, away_defenceDefenderLineClass)
        ]

  chr_cols <- lapply(output, function(x) class(x)[1]) %>%
    unlist %>%
    unname %>%
    equals("character") %>%
    which

  for (col in chr_cols) {
    set(output, j = col, value = as.factor(output[[col]]))
  }

  return(output)
}
