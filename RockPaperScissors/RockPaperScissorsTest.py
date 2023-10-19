## NAME == EDEM QUASHIGAH

import unittest
import RockPaperScissorsUtils

class RockPaperScissorsTest(unittest.TestCase):
## TEST FOR Rock vs Rock (Same values)
    def test_RockPaperScissorsTest_SameValues(self):

        ## ARRANGE
        player = "rock"
        machine = "rock"

        ## ACT 
        result = RockPaperScissorsUtils.RockPaperScissors(player, machine)

        ## Assert
        self.assertEqual(result, "It's a DRAW!")

## TEST FOR Rock vs Paper
    def test_RockPaperScissorsTest_Rock_vs_Paper(self):

        ## ARRANGE
        player = "rock"
        machine = "paper"

        ## ACT 
        result = RockPaperScissorsUtils.RockPaperScissors(player, machine)

        ## Assert
        self.assertEqual(result, "You LOSE!")


## TEST FOR Rock vs Scissors
    def test_RockPaperScissorsTest_Rock_vs_Scissors(self):

        ## ARRANGE
        player = "rock"
        machine = "scissors"

        ## ACT 
        result = RockPaperScissorsUtils.RockPaperScissors(player, machine)

        ## Assert
        self.assertEqual(result, "You WIN!")

## TEST FOR CASE_SENSITIVITY
    def test_RockPaperScissorsTest_CaseSensitive(self):

        ## ARRANGE
        player = "pAPeR"
        machine = "scissors"

        ## ACT 
        result = RockPaperScissorsUtils.RockPaperScissors(player, machine)

        ## Assert
        self.assertEqual(result, "You LOSE!")


## TEST FOR CASE_SENSITIVITY
    def test_RockPaperScissorsTest_Invalid_Input(self):

        ## ARRANGE
        player = "Edem"
        machine = "rock"

        ## ACT 
        result = RockPaperScissorsUtils.RockPaperScissors(player, machine)

        ## Assert
        self.assertEqual(result, "Invalid input. Please type 'rock', 'paper' or 'scissors'")


if(__name__ == "__main__"):
    unittest.main()