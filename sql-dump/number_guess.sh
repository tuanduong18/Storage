#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

CORRECT_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_GUESSES=0

GREETINGS() {
  echo "Enter your username:"
  read NAME
  NAME_LENGTH=$(echo -n $NAME | wc -m)
  while [[ $NAME_LENGTH -gt 22 || $NAME_LENGTH -eq 0 ]]
  do
    echo -e "\nUsername must be at most 22 characters and cannot be null"
    echo "Enter your username:"
    read NAME
    NAME_LENGTH=$(echo -n $NAME | wc -m)
  done
  
  USER_ID=$($PSQL "select user_id from users where name='$NAME'")
  if [[ -z $USER_ID ]]
  then
    echo "Welcome, $NAME! It looks like this is your first time here."
  else
    GAMES=$($PSQL "select COUNT(*), MIN(number_of_guesses) from games where user_id='$USER_ID'")
    IFS='|' read GAMES_PLAYED BEST_GAME <<<"$GAMES"
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  PLAY
}

PLAY() {
  if [[ -z $1 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $1
  fi
  read NUMBER
  (( NUMBER_GUESSES += 1 ))
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then 
    PLAY "That is not an integer, guess again:"
  elif [[ $NUMBER -gt $CORRECT_NUMBER ]]
  then
    PLAY "It's lower than that, guess again:"
  elif [[ $NUMBER -lt $CORRECT_NUMBER ]]
  then
    PLAY "It's higher than that, guess again:"
  else
    END_GAME
  fi
}

END_GAME() {
  if [[ -z $USER_ID ]]
  then
    a=$($PSQL "insert into users(name) values ('$NAME')")
    USER_ID=$($PSQL "select user_id from users where name='$NAME'")
  fi
  b=$($PSQL "insert into games(user_id, number_of_guesses) values ($USER_ID, $NUMBER_GUESSES)")
  echo "You guessed it in $NUMBER_GUESSES tries. The secret number was $CORRECT_NUMBER. Nice job!"
}

GREETINGS