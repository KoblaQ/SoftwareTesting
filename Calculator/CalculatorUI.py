import CalculatorUtils

#Ask from user what calculation we do
# Let's enable multiple calculations
# Type conversion expectation

operand = "start"

while(operand != "exit"):
    operand = input("Do you want to '+', '-', '*' or '/' ? 'exit' will end the app: ")

    if(operand != "exit"):

        if(operand == '+' or operand == '-' or operand == '*' or operand == '/'):

            number1Given = False
            number2Given = False

            while (not number1Given):
                try:
                    number1 = int(input("Give a number 1: "))
                    number1Given = True
                except Exception:
                    print("Number was not valid. Try again.")


            while (not number2Given):
                try:
                    number2 = int(input("Give a number 2: "))
                    number2Given = True
                except Exception:
                    print("Number was not valid. Try again.")

            match operand:
                case '+':
                    print(CalculatorUtils.addition(number1, number2))
                case '-':
                    print(CalculatorUtils.subtraction(number1, number2))
                case '*':
                    print(CalculatorUtils.multiplication(number1, number2))
                case '/':
                    print(CalculatorUtils.division(number1, number2))
    else:
        print("Thank you for using this application")