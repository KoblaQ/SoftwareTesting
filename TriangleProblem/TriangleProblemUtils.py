## NAME == EDEM QUASHIGAH

def inputValidation(value):
#Try Catch for invalid input
    try:
            return int(value)
    except Exception:
            return('String')

def triangleSides(a,b,c):
    ## Check each input to make sure it is valid
    a = inputValidation(a)
    b = inputValidation(b)
    c = inputValidation(c)

    ## Check to make sure that all sides are int and not string values
    if a == 'String' or b == 'String' or c == 'String':
        return("Error message: invalid input data value")
    else:
        ## Conditions for Equilateral Triangle
        if(a == b and a == c):
            return("Equilateral triangle")
        ## Conditions for Isosceles Triangle
        if(a == b or a == c or b == c):
            return("Isosceles triangle")
        ## Conditions for Scalene Triangle
        if(a != b or a!= c or b != c):
            return("Scalene triangle")


## TriangleProblemUI
if(__name__ == "__main__"):
    a = 3
    b = 3
    c = 3
    print(triangleSides(a,b,c)) 