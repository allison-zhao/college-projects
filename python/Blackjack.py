#Allison Zhao, Section 3, Assignment 8, Part 3 (Extra Credit)

import random

#creating the list
cards  = ['10 of Hearts', '9 of Hearts', '8 of Hearts', '7 of Hearts', '6 of Hearts', '5 of Hearts', '4 of Hearts', '3 of Hearts', '2 of Hearts', 'Ace of Hearts', 'King of Hearts', 'Queen of Hearts', 'Jack of Hearts', '10 of Diamonds', '9 of Diamonds', '8 of Diamonds', '7 of Diamonds', '6 of Diamonds', '5 of Diamonds', '4 of Diamonds', '3 of Diamonds', '2 of Diamonds', 'Ace of Diamonds', 'King of Diamonds', 'Queen of Diamonds', 'Jack of Diamonds', '10 of Clubs', '9 of Clubs', '8 of Clubs', '7 of Clubs', '6 of Clubs', '5 of Clubs', '4 of Clubs', '3 of Clubs', '2 of Clubs', 'Ace of Clubs', 'King of Clubs', 'Queen of Clubs', 'Jack of Clubs', '10 of Spades', '9 of Spades', '8 of Spades', '7 of Spades', '6 of Spades', '5 of Spades', '4 of Spades', '3 of Spades', '2 of Spades', 'Ace of Spades', 'King of Spades', 'Queen of Spades', 'Jack of Spades']

values = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 10, 10]

playerhand=[]

computerhand=[]

keepgoing=True

#pull out two random cards for both user and computer

#user's first 2 cards
card1pos = random.randint(0,len(cards))
playerhand.append(cards[card1pos])
cards.remove(cards[card1pos])
card2pos = random.randint(0,(len(cards)-1))
playerhand.append(cards[card2pos])
cards.remove(cards[card2pos])
valueofcards = values[card1pos]+values[card2pos]
del values[card1pos]
del values[card2pos]

print("Welcom to Blackjack!")

#Show player the 2 cards that was just dealt
print("Player hand: "," [", playerhand ,"]"," is worth ",valueofcards, sep="")


#ask the user to hit or stand

while keepgoing==True:

    hos=input("(h)it or (s)tand?")

    if hos == "h":
        cardhitpos= random.randint(0,len(cards))
        print("You drew:", cards[cardhitpos])
        valueofcards += values[cardhitpos]
        playerhand.append(cards[cardhitpos])
        print("Player hand: ", playerhand," is worth ",valueofcards, sep="")


        #when user goes over 21
        if valueofcards > 21:
            print("Bust!")
            print("Computer Wins!")
            keepgoing=False
            break
        elif valueofcards == 21:
            print("Black Jack! Player Wins!")
            keepgoing=False
            break
        
        else:
            del cards[cardhitpos]
            del values[cardhitpos]

    elif hos == "s":

        #computer's first 2 cards
        ccard1pos = random.randint(0,len(cards))
        computerhand.append(cards[ccard1pos])
        cards.remove(cards[ccard1pos])
        ccard2pos = random.randint(0,len(cards))
        computerhand.append(cards[ccard2pos])
        cards.remove(cards[ccard2pos])
        cvalueofcards = values[ccard1pos]+values[ccard2pos]
        print("Computer hand: ", computerhand," is worth ",cvalueofcards, sep="")
        del values[ccard1pos]
        del values[ccard2pos]
       
                
        #while loop for computer to keep hitting
        while True:
            ccardhitpos=random.randint(0,len(cards))
            cvalueofcards += values [ccardhitpos]
            computerhand.append(cards[ccardhitpos])
            print("Computer drew",cards[ccardhitpos])

            if cvalueofcards == 21:
                print("Computer hand: ", computerhand," is worth ",cvalueofcards, sep="")
                print("Black Jack! Computer Wins!")
                keepgoing=False
                break
                
           

            elif cvalueofcards < 21 and cvalueofcards > valueofcards:
                print("Computer hand: ", computerhand," is worth ",cvalueofcards, sep="")
                print("Computer wins!")
                keepgoing=False
                break
            

            elif cvalueofcards > 21 and valueofcards < 21:
                print("Computer hand: ", computerhand," is worth ",cvalueofcards, sep="")
                print("Bust! Player wins!")
                keepgoing=False
                break


            else:
                print("Computer hand: "," [", computerhand ,"]"," is worth ",cvalueofcards, sep="")
                del cards[ccardhitpos]
                del values[ccardhitpos]
                          
            
            


            

