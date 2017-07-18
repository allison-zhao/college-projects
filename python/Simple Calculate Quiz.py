#Allison Zhao, Section 3, Assignment 6

#NOTE: in the extra credit part, i displayed how many correct answers user inputed
#regardless of the fact that it will always be correct and 100% since i prompt them back
#if they got a wrong answer. I just thought that I should leave it there to receive
#full credit because it is afterall a question in the extra credit assignment list
#Thank you! :)

import myfunctions
import random


#Ask the user for how many attempts they would like
while True:
    attempts=int(float(input("How many problems would you like to attempt?")))

    #Prompt user back if number is invalid
    if attempts <= 0:
        print("Invalid number, try again")
    #break out of the loop
    else:
        break

#Ask the user for how wide they would like their digits to be
while True:
    wide=int(float(input("How wide do you want your digits to be?(Choose an integer between 5 and 10)")))

    #break out of the loop if entry is valid
    if wide >= 5 and wide <= 10:
        print("Here we go!")
        break
    #Prompt user back if width is invalid
    else:
        print("Invalid number, try again")



#Start the game

#start a counter for checking right answers for user input
counter=0

#Set variables for later statistics
plusattempt=0
minusattempt=0
multiattempt=0
divisionattempt=0
plusright=0
minusright=0
multiright=0
divisionright=0
plusextra=0
minusextra=0
multiextra=0
divisionextra=0


#For loop for the number of attempts user like to receive
for i in range(1,attempts+1):

    #while loop for ruling out exceptions (explained below)
    while True:
        width=wide
        number1=random.randrange(0,9)
        number2=random.randrange(0,9)
        operator=random.randrange(0,4)
    

        #rule out the situations when divisor is 0 or when number1/number2 is not an integer
        if operator == 3 and (number2 == 0 or number1 % number2 != 0):
            continue
        
        #if everything is valid, then start the game
        else:

            print("What is .....")
            print()
            
            #print the pattern of first number
            
            if number1 == 1:
                myfunctions.number_1(width)
                    
            elif number1 == 2:
                myfunctions.number_2(width)
                    
            elif number1 == 3:
                myfunctions.number_3(width)
                    
            elif number1 == 4:
                myfunctions.number_4(width)
                
            elif number1 == 5:
                myfunctions.number_5(width)
                        
            elif number1 == 6:
                myfunctions.number_6(width)
                        
            elif number1 == 7:
                myfunctions.number_7(width)
                        
            elif number1 == 8:
                myfunctions.number_8(width)
                        
            elif number1 == 9:
                myfunctions.number_9(width)
                        
            elif number1 == 0:
                myfunctions.number_0(width)
            print()
                    

            #print the pattern of operator
            
            if operator == 0:
                myfunctions.plus(width)
                plusattempt += 1
            elif operator == 1:
                myfunctions.minus(width)
                minusattempt += 1
            elif operator == 2:
                myfunctions.multi(width)
                multiattempt +=1
            elif operator == 3:
                myfunctions.division(width)
                divisionattempt +=1
            print()
                     

            #print the pattern of second number
            if number2 == 1:
                myfunctions.number_1(width)
            elif number2 == 2:
                myfunctions.number_2(width)
            elif number2 == 3:
                myfunctions.number_3(width)
            elif number2 == 4:
                myfunctions.number_4(width)
            elif number2 == 5:
                myfunctions.number_5(width)
            elif number2 == 6:
                myfunctions.number_6(width)
            elif number2 == 7:
                myfunctions.number_7(width)
            elif number2 == 8:
                myfunctions.number_8(width)
            elif number2 == 9:
                myfunctions.number_9(width)
            elif number2 == 0:
                myfunctions.number_0(width)
            print()
            print()
            
            #Ask the user to input an answer         
            while True:
                useranswer=int(float(input("=")))

                #user get it right
                if myfunctions.check_answer(number1,number2,useranswer,operator) == True:
                    print("Correct!")
                    counter += 1

                    #add 1 to statistic counters
                    if operator == 0:
                        plusright += 1
                    elif operator == 1:
                        minusright += 1
                    elif operator == 2:
                        multiright += 1
                    elif operator == 3:
                        divisionright += 1
                    
                    break

                #user get it wrong
                else:
                    print("Sorry, that's not correct.")

                    #add 1 to extra attempts counter
                    if operator == 0:
                        plusextra += 1
                    elif operator == 1:
                        minusextra += 1
                    elif operator == 2:
                        multiextra += 1
                    elif operator == 3:
                        divisionextra += 1
                    
            break

print()
print("You got",counter,"out of",attempts,"correct!")
print()

#track plus questions and present stats
if plusattempt != 0:
    print("Total addition problems presented:", plusattempt)
    print("Correct addition problems: ", plusright, " (",int(float((plusright/plusattempt)*100)),"%",")",sep="")
    if plusextra == 0:
        print("# of extra attempts needed:", plusextra,"(perfect!)")
    else:
        print("# of extra attempts needed:", plusextra)
    print()
        
else:
    print("No addition problems presented")
    print()

#track mins questions and present stats
if minusattempt != 0:
    print("Total subtraction problems presented:", minusattempt)
    print("Correct subtraction problems: ", minusright, " (",int(float((minusright/minusattempt)*100)),"%",")",sep="")
    if minusextra == 0:
        print("# of extra attempts needed:", minusextra,"(perfect!)")
    else:
        print("# of extra attempts needed:", minusextra)
    print()

else:
    print("No subtraction problems presented")
    print()
    
#track multiplication questions and present stats
if multiattempt != 0:
    print("Total multiplication problems presented:", multiattempt)
    print("Correct multiplication problems: ", multiright, " (",int(float((multiright/multiattempt)*100)),"%",")",sep="")
    if multiextra == 0:
        print("# of extra attempts needed:", multiextra,"(perfect!)")
    else:
        print("# of extra attempts needed:", multiextra)
    print()
else:
    print("No multiplication problems presented")
    print()
    
#track division questions and present stats
if divisionattempt != 0:
    print("Total division problems presented:", divisionattempt)
    print("Correct division problems: ", divisionright, " (",int(float((divisionright/divisionattempt)*100)),"%",")",sep="")
    if divisionextra == 0:
        print("# of extra attempts needed:", divisionextra,"(perfect!)")
    else:
        print("# of extra attempts needed:", divisionextra)
    print()
    
else:
    print("No division problems presented")
    print()

print()
print()
print("Thanks for playing!")
            







        



