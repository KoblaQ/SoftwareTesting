import unittest
import FizzBuzzEngine

class MyFizzBuzzTest(unittest.TestCase):
    def test_Send1_ToFizzBuzzEngine_Result_1(self):

        ## ARRANGE
        value = int(1)
        expectedResult = int(1)


        ## ACT 
        result = FizzBuzzEngine.outputResult(value)


        ## ASSERT
        self.assertEqual(result, expectedResult)

    def test_Send2_ToFizzBuzzEngine_Result_2(self):

            ## ARRANGE
            value = int(2)
            expectedResult = int(2)


            ## ACT 
            result = FizzBuzzEngine.outputResult(value)


            ## ASSERT
            self.assertEqual(result, expectedResult)

    def test_Send3_ToFizzBuzzEngine_Result_Fizz(self):

            ## ARRANGE
            value = int(3)
            expectedResult = "Fizz"


            ## ACT 
            result = FizzBuzzEngine.outputResult(value)


            ## ASSERT
            self.assertEqual(result, expectedResult)


    def test_Send4_ToFizzBuzzEngine_Result_4(self):

            ## ARRANGE
            value = int(4)
            expectedResult = int(4)


            ## ACT 
            result = FizzBuzzEngine.outputResult(value)


            ## ASSERT
            self.assertEqual(result, expectedResult)


    def test_Send15_ToFizzBuzzEngine_Result_15(self):

            ## ARRANGE
            value = int(15)
            expectedResult = "FizzBuzz"


            ## ACT 
            result = FizzBuzzEngine.outputResult(value)


            ## ASSERT
            self.assertEqual(result, expectedResult)
if(__name__ == "__main__"):
    unittest.main()