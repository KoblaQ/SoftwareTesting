import unittest
import AgeVerification

class AgeVerificationTest(unittest.TestCase):
    def test_AgeInputOfAgeBelow_18(self):
        #Arrange
        age = int(17)

        #Act
        result = AgeVerification.verifyAge(age)

        #Assert
        self.assertEqual(result,"You are a child")
        

    def test_AgeInputOfAgeBetween_18_and_70(self):
        #Arrange
        age = int(56)

        #Act
        result = AgeVerification.verifyAge(age)

        #Assert
        self.assertEqual(result,"You are an adult")

    def test_AgeInputOfAgeAbove_70(self):
        #Arrange
        age = int(79)

        #Act
        result = AgeVerification.verifyAge(age)

        #Assert
        self.assertEqual(result,"You are a pensioner")

if(__name__ == "__main__"):
    unittest.main()