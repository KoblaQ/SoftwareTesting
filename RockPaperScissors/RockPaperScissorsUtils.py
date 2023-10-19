## NAME == EDEM QUASHIGAH

import random


def RockPaperScissors(userInput, computerChoice):
    ## Convert the input from user to lowercase
    userInput = userInput.lower()
    options = ["rock", "paper", "scissors"]

## Generating Random values for the computer
    if not computerChoice:
        computerChoice = random.choice(options)

## Confirming if the userInput is valid for the game
    if userInput not in options:
        return("Invalid input. Please type 'rock', 'paper' or 'scissors'")
    ## If values are the same
    if userInput == computerChoice:
        return("It's a DRAW!")
    else:
        ## If user chose ROCK
        if userInput == "rock":
            if computerChoice == "paper":
                return("You LOSE!")
            elif computerChoice == "scissors":
                return("You WIN!")

        ## If user chose PAPER
        if userInput == "paper":
            if computerChoice == "rock":
                return("You WIN!")
            elif computerChoice == "scissors":
                return("You LOSE!")

        ## If user chose SCISSORS
        if userInput == "scissors":
            if computerChoice == "rock":
                return("You LOSE!")
            elif computerChoice == "paper":
                return("You WIN!")
