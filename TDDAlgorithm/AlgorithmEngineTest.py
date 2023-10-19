import unittest
import AlgorithmEngine


class MyAlgorithTest(unittest.TestCase):
    def test_Input10_ToAlgorithmEngine_Result_1(self):

        ## ARRANGE
        value = int(12)
        expectedResult = 1

        ## ACT
        result = AlgorithmEngine.Algorithm(value)

        ## ASSERT
        self.assertEqual(result, expectedResult)


if(__name__ == "__main__"):
    unittest.main()