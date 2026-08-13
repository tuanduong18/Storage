#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
CSV_FILE="games.csv"
declare -A TEAM_ID_LOOK_UP
x=$($PSQL "TRUNCATE TABLE games, teams;")
# insert teams
{
    read -r header # Consumes and discards the first line
    while IFS=',' read -r -a ROW
    do
      if [[ ! -v TEAM_ID_LOOK_UP[${ROW[2]}] ]]
      then
        a=$($PSQL "INSERT INTO teams (name) VALUES ('${ROW[2]}');")
        TEAM_ID_LOOK_UP[${ROW[2]}]=$($PSQL "SELECT team_id FROM teams where name='${ROW[2]}' LIMIT 1;")
      fi
      if [[ ! -v TEAM_ID_LOOK_UP[${ROW[3]}] ]]
      then
        b=$($PSQL "INSERT INTO teams (name) VALUES ('${ROW[3]}');")
        TEAM_ID_LOOK_UP[${ROW[3]}]=$($PSQL "SELECT team_id FROM teams where name='${ROW[3]}' LIMIT 1;")
      fi
    done
} < $CSV_FILE

# insert games
{
    read -r header # Consumes and discards the first line
    while IFS=',' read -r -a ROW
    do
      winner_id=${TEAM_ID_LOOK_UP[${ROW[2]}]}
      opponent_id=${TEAM_ID_LOOK_UP[${ROW[3]}]}
      c=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
       VALUES (${ROW[0]}, '${ROW[1]}', $winner_id, $opponent_id, ${ROW[4]}, ${ROW[5]});")
    done
} < $CSV_FILE