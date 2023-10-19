
if(__name__ == "__main__"):
    ageGiven = False
    while (not ageGiven):
        try: 
            age = int(input("How old are you?: "))
            ageGiven = True
        except  Exception:
            print("Value input was not valid, Try again")