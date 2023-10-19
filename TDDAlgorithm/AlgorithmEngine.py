value = 24

def Algorithm(value):
    while(value > 1):
        if(value % 2 == 0):
            value = value / 2
            #print(value)
        elif(value % 2 != 0):
            value = (value * 3) + 1
            #print(value)
    return value

Algorithm(value)