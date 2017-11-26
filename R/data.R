#' Country data
#'
#' The 11 countries in the dataset
#' @format A data table with 11 rows and 2 variables
#' \describe{
#'   \item{id}{Country ID}
#'   \item{name}{Country name}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"country"



#' League
#'
#'
#' @format A data table with 11 rows and 3 variables
#' \describe{
#'   \item{id}{Same as the `id` column from `country`}
#'   \item{country_id}{Matches the `id` column from `country`}
#'   \item{name}{Full name of the national league}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"league"



#' Football Match
#'
#'
#'
#' @format A data table with 25979 rows and 115 variables
#' \describe{
#'   \item{id}{}
#'   \item{country_id}{}
#'   \item{league_id}{}
#'   \item{season}{}
#'   \item{stage}{}
#'   \item{date}{}
#'   \item{match_api_id}{}
#'   \item{home_team_api_id}{}
#'   \item{away_team_api_id}{}
#'   \item{home_team_goal}{}
#'   \item{away_team_goal}{}
#'   \item{home_player_X1}{}
#'   \item{home_player_X2}{}
#'   \item{home_player_X3}{}
#'   \item{home_player_X4}{}
#'   \item{home_player_X5}{}
#'   \item{home_player_X6}{}
#'   \item{home_player_X7}{}
#'   \item{home_player_X8}{}
#'   \item{home_player_X9}{}
#'   \item{home_player_X10}{}
#'   \item{home_player_X11}{}
#'   \item{away_player_X1}{}
#'   \item{away_player_X2}{}
#'   \item{away_player_X3}{}
#'   \item{away_player_X4}{}
#'   \item{away_player_X5}{}
#'   \item{away_player_X6}{}
#'   \item{away_player_X7}{}
#'   \item{away_player_X8}{}
#'   \item{away_player_X9}{}
#'   \item{away_player_X10}{}
#'   \item{away_player_X11}{}
#'   \item{home_player_Y1}{}
#'   \item{home_player_Y2}{}
#'   \item{home_player_Y3}{}
#'   \item{home_player_Y4}{}
#'   \item{home_player_Y5}{}
#'   \item{home_player_Y6}{}
#'   \item{home_player_Y7}{}
#'   \item{home_player_Y8}{}
#'   \item{home_player_Y9}{}
#'   \item{home_player_Y10}{}
#'   \item{home_player_Y11}{}
#'   \item{away_player_Y1}{}
#'   \item{away_player_Y2}{}
#'   \item{away_player_Y3}{}
#'   \item{away_player_Y4}{}
#'   \item{away_player_Y5}{}
#'   \item{away_player_Y6}{}
#'   \item{away_player_Y7}{}
#'   \item{away_player_Y8}{}
#'   \item{away_player_Y9}{}
#'   \item{away_player_Y10}{}
#'   \item{away_player_Y11}{}
#'   \item{home_player_1}{}
#'   \item{home_player_2}{}
#'   \item{home_player_3}{}
#'   \item{home_player_4}{}
#'   \item{home_player_5}{}
#'   \item{home_player_6}{}
#'   \item{home_player_7}{}
#'   \item{home_player_8}{}
#'   \item{home_player_9}{}
#'   \item{home_player_10}{}
#'   \item{home_player_11}{}
#'   \item{away_player_1}{}
#'   \item{away_player_2}{}
#'   \item{away_player_3}{}
#'   \item{away_player_4}{}
#'   \item{away_player_5}{}
#'   \item{away_player_6}{}
#'   \item{away_player_7}{}
#'   \item{away_player_8}{}
#'   \item{away_player_9}{}
#'   \item{away_player_10}{}
#'   \item{away_player_11}{}
#'   \item{goal}{}
#'   \item{shoton}{}
#'   \item{shotoff}{}
#'   \item{foulcommit}{}
#'   \item{card}{}
#'   \item{cross}{}
#'   \item{corner}{}
#'   \item{possession}{}
#'   \item{B365H}{}
#'   \item{B365D}{}
#'   \item{B365A}{}
#'   \item{BWH}{}
#'   \item{BWD}{}
#'   \item{BWA}{}
#'   \item{IWH}{}
#'   \item{IWD}{}
#'   \item{IWA}{}
#'   \item{LBH}{}
#'   \item{LBD}{}
#'   \item{LBA}{}
#'   \item{PSH}{}
#'   \item{PSD}{}
#'   \item{PSA}{}
#'   \item{WHH}{}
#'   \item{WHD}{}
#'   \item{WHA}{}
#'   \item{SJH}{}
#'   \item{SJD}{}
#'   \item{SJA}{}
#'   \item{VCH}{}
#'   \item{VCD}{}
#'   \item{VCA}{}
#'   \item{GBH}{}
#'   \item{GBD}{}
#'   \item{GBA}{}
#'   \item{BSH}{}
#'   \item{BSD}{}
#'   \item{BSA}{}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"football_match"




#' Player data
#'
#' @format A data table with 11060 rows and 7 variables
#' \describe{
#'   \item{id}{}
#'   \item{player_api_id}{}
#'   \item{player_name}{}
#'   \item{player_fifa_api_id}{}
#'   \item{birthday}{}
#'   \item{height}{}
#'   \item{weight}{}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"player"



#' Player attributes
#'
#' @format A data table with 183978 rows and 42 variables
#' \describe{
#'   \item{id}{}
#'   \item{player_fifa_api_id}{}
#'   \item{player_api_id}{}
#'   \item{date}{}
#'   \item{overall_rating}{}
#'   \item{potential}{}
#'   \item{preferred_foot}{}
#'   \item{attacking_work_rate}{}
#'   \item{defensive_work_rate}{}
#'   \item{crossing}{}
#'   \item{finishing}{}
#'   \item{heading_accuracy}{}
#'   \item{short_passing}{}
#'   \item{volleys}{}
#'   \item{dribbling}{}
#'   \item{curve}{}
#'   \item{free_kick_accuracy}{}
#'   \item{long_passing}{}
#'   \item{ball_control}{}
#'   \item{acceleration}{}
#'   \item{sprint_speed}{}
#'   \item{agility}{}
#'   \item{reactions}{}
#'   \item{balance}{}
#'   \item{shot_power}{}
#'   \item{jumping}{}
#'   \item{stamina}{}
#'   \item{strength}{}
#'   \item{long_shots}{}
#'   \item{aggression}{}
#'   \item{interceptions}{}
#'   \item{positioning}{}
#'   \item{vision}{}
#'   \item{penalties}{}
#'   \item{marking}{}
#'   \item{standing_tackle}{}
#'   \item{sliding_tackle}{}
#'   \item{gk_diving}{}
#'   \item{gk_handling}{}
#'   \item{gk_kicking}{}
#'   \item{gk_positioning}{}
#'   \item{gk_reflexes}{}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"player_attributes"


#' Team data
#'
#' @format A data table with 299 rows and 5 variables
#' \describe{
#'   \item{id}{}
#'   \item{team_api_id}{}
#'   \item{team_fifa_api_id}{}
#'   \item{team_long_name}{}
#'   \item{team_short_name}{}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"team"



#' Team attributes
#'
#' @format A data table with 1458 rows and 25 variables
#' \describe{
#'   \item{id}{}
#'   \item{team_fifa_api_id}{}
#'   \item{team_api_id}{}
#'   \item{date}{}
#'   \item{buildUpPlaySpeed}{}
#'   \item{buildUpPlaySpeedClass}{}
#'   \item{buildUpPlayDribbling}{}
#'   \item{buildUpPlayDribblingClass}{}
#'   \item{buildUpPlayPassing}{}
#'   \item{buildUpPlayPassingClass}{}
#'   \item{buildUpPlayPositioningClass}{}
#'   \item{chanceCreationPassing}{}
#'   \item{chanceCreationPassingClass}{}
#'   \item{chanceCreationCrossing}{}
#'   \item{chanceCreationCrossingClass}{}
#'   \item{chanceCreationShooting}{}
#'   \item{chanceCreationShootingClass}{}
#'   \item{chanceCreationPositioningClass}{}
#'   \item{defencePressure}{}
#'   \item{defencePressureClass}{}
#'   \item{defenceAggression}{}
#'   \item{defenceAggressionClass}{}
#'   \item{defenceTeamWidth}{}
#'   \item{defenceTeamWidthClass}{}
#'   \item{defenceDefenderLineClass}{}
#' }
#'
#' @source \url{https://www.kaggle.com/hugomathien/soccer}
"team_attributes"

