#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Check if the user exists
USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  # Returning user
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

# Initialize guess count
GUESS_COUNT=0

while true
do
  read GUESS

  # Validate input
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if (( GUESS == SECRET_NUMBER ))
  then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update database
    if [[ -z $USER_INFO ]]
    then
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    fi

    UPDATE_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")
    if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]
    then
      UPDATE_BEST=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE user_id = $USER_ID")
    fi

    break
  elif (( GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done