import TriangleProblemUtils

# Ask from user the values of each triangle side
a = 3
b = 3
c = 3
TriangleProblemUtils.triangleSides(a,b,c)
"""
Place the if statement in another if statement. Where it first checks the validity of the input data
Then it runs the rest of the code. 
"""
""" 

if(__name__ == "__main__"):
    lengthA = False
    lengthB = False
    lengthC = False

#Try Catch for sideA input
    while(not lengthA):
        try:
            a = int(input("Input the length of side a: "))
            lengthA = True
        except Exception:
            print("Input value was not valid. Try again")
    
# Try Catch for sideB input
    while(not lengthB):
        try:
            b = int(input("Input the length of side b: "))
            lengthB = True
        except Exception:
            print("Input value was not valid. Try again")

#Try Catch for SideC input
    while(not lengthC):
        try:
            c = int(input("Input the length of side c: "))
            lengthC = True
        except Exception:
            print("Input value was not valid. Try again")

    TriangleProblemUtils.triangleSides(a,b,c)

    """