#Allison Zhao, Section 3, 3/1/15, Assignment 4, Problem 1, Roll the Dice

#Get the number of sides from user
import random

while True:

    numberinput = int(float(input("How many sides on your dice?(Integers >= 3 only)")))

    if numberinput < 3:
        print("Sorry, that's not a valid size value! Please choose a positive number larger or equal to 3.")
    
    else:
        print("Thanks! Here we go...")
        break

#keep track of what attempt we are on and what the user rolled

attempts = 0
doubles = 0
keepgoing = True
dice1average=0
dice2average=0


while keepgoing == True:
    dice1= random.randint(1,numberinput)
    dice2= random.randint(1,numberinput)
    attempts += 1
 
#regular rolls   
    if dice1 != dice2:
        print(attempts, "."," Die number 1 is ", dice1," and Die number 2 is ",dice2,".", sep="")
        dice1average += dice1
        dice2average += dice2

#doubles
    elif dice1 == dice2 and dice1 != 1 and dice2 != 1:
        print(attempts, "."," Die number 1 is ", dice1," and Die number 2 is ",dice2,".", sep="")
        doubles += 1
        dice1average += dice1
        dice2average += dice2

#snake eyes
    elif dice1 == 1 and dice2 == 1:
    
        doubles += 1
        dice1average += dice1
        dice2average += dice2
        dice1averagef=format(dice1average/attempts,".2f")
        dice2averagef=format(dice2average/attempts,".2f")

        print()
        print("You got snake eyes! Finally! On try number ", attempts,"!", sep="")
        print("Along the way you rolled doubles ", doubles," time(s).", sep="")
        print("The average roll for die #1 was", dice1averagef)
        print("The average roll for die #2 was", dice2averagef)

        break
    
    
    

    
    
