## NAME == EDEM QUASHIGAH
import unittest
import TriangleProblemUtils

class TriangleProblemTest(unittest.TestCase):

    ## TEST FOR EQUILATERAL TRIANGLE
    def test_TriangleProblemTest_EquilateralTriangle(self):

        ## Arrange
        a = int(7)
        b = int(7)
        c = int(7)

        ## Act
        result = TriangleProblemUtils.triangleSides(a,b,c)

        ## Assert
        self.assertEqual(result, "Equilateral triangle")

    ## TEST FOR ISOSCELES TRIANGLE
    def test_TriangleProblemTest_IsoscelesTriangle(self):

        ## Arrange
        a = int(5)
        b = int(5)
        c = int(3)

        ## Act
        result = TriangleProblemUtils.triangleSides(a,b,c)

        ## Assert
        self.assertEqual(result, "Isosceles triangle")


    ## TEST FOR SCALENE TRIANGLE
    def test_TriangleProblemTest_ScaleneTriangle(self):

        ## Arrange
        a = int(5)
        b = int(6)
        c = int(7)

        ## Act
        result = TriangleProblemUtils.triangleSides(a,b,c)

        ## Assert
        self.assertEqual(result, "Scalene triangle")


    ## TEST FOR INVALID INPUT DATA
    def test_TriangleProblemTest_InvalidInput(self):

        ## Arrange
        a = int(5)
        b = int(8)
        c = "fff"

        ## Act
        result = TriangleProblemUtils.triangleSides(a,b,c)

        ## Assert
        self.assertEqual(result, "Error message: invalid input data value")


if(__name__ == "__main__"):
    unittest.main()