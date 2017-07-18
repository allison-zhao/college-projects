#Allison Zhao, Section 3, 3/1/15, Assignment 4, Part 2, Pick up sticks

#Ask the user to input how many sticks are on the table

while True:
    
    totalsticks=int(float(input("How many sticks are on the table?(enter a number between 10 and 100)")))

    if totalsticks < 10 or totalsticks > 100:
        print ("Invalid number of sticks, please try again.")

    else:
        break
        print()
        
#Tell the user how many sticks are on the table

player=1

while True:
    print()
    print("There are", totalsticks, "on the table.")
    print()
   
    print("Turn: Player",player)
    remove=int(float(input("How many sticks do you want to remove from the table?(1,2 or 3):")))

    #when user takes less than one or more than three sticks
    if remove<1 or remove >3:
        print ("Invalid number of sticks, please try again.")

    #when user takes # sticks more than what is left
    elif remove > totalsticks:
        print("There are not enough sticks left. Pick a smaller number of sticks!")

    # when the # will bring us down to zero
    elif totalsticks - remove == 0:
        print("Player", player, "loses!")
        break

    #when user takes # sticks that are okay
    else:
        totalsticks -= remove
        if player == 1:
            player += 1
        elif player == 2:
            player -= 1


    
       
