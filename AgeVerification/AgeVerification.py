
import AgeVerificationUI

def verifyAge(age):
    if(age < 18):
        return("You are a child")
    if(age >= 18 and age < 70):
        return("You are an adult")
    if(age >= 70):
        return("You are a pensioner")

#This Can also be placed in the original file by using the __name__ methods. 
#Otherwise it is recommended to place them in a seperate file
"""
if(__name__ == "__main__"):
    ageGiven = False
    while (not ageGiven):
        try: 
            age = int(input("How old are you?: "))
            ageGiven = True
        except  Exception:
            print("Value input was not valid, Try again")
            """