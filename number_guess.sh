#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"

NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $NUMBER

echo "Enter your username:"
read NAME
USERNAME=$($PSQL "SELECT username FROM number_guess WHERE username = '$NAME'")
if [[ -z $USERNAME ]]
then
  INSERT_USER=$($PSQL "INSERT INTO number_guess(username) VALUES('$NAME')")
  echo "Welcome, $NAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$NAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$NAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
COUNTER=0 
until [[ $GUESS -eq $NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  fi
  if [[ $GUESS < $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    COUNTER=$(($COUNTER + 1 ))
    read GUESS
  fi
  if [[ $GUESS > $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    COUNTER=$(($COUNTER + 1 ))
    read GUESS
  fi
done

COUNTER=$(($COUNTER + 1 ))
GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username = '$NAME'")
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played = $GAMES_PLAYED+1 WHERE username = '$NAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username = '$NAME'")
if [[ -z $BEST_GAME ]]
then 
  UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game = $COUNTER WHERE username = '$NAME' ")
else
  if [[ $COUNTER -lt $BEST_GAME ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game = $COUNTER WHERE username = '$NAME' ")
  fi
fi

echo "You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!"