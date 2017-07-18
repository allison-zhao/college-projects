#Allison Zhao, Section 3, Assignment 7, Part 3a


# function:   add_letters
# input:      a word to scramble (String) and a number of letters (integer)
# processing: adds a number of random letters (A-Z; a-z) after each letter 
#             in the supplied word. for example, if word="cat" and num=1 
#             we could generate any of the following:
#             cZaQtR
#             cwaRts
#             cEaett
# 
#             if word="cat" and num=2 we could generate any of the following:
#             cRtaHFtui
#             cnnaNYtjn
#             czAaAitym
#
# output:     returns the newly generated word


import random
import string

def add_letters(word, num):

    #start with an empty string
    count=""

    #for loop for each character in the word
    for i in word:
        count += i

        #for loop for the random characters after each character from the word
        for n in range(1,num+1):
            count += random.choice(string.ascii_letters)

    #return the final string
    return count





# function:   remove_letters
# input:      a word to unscramble (String) and the number of characters to remove (integer)
# processing: the function starts at the first position in the supplied word and keeps it.
#             it then removes "num" characters from the word. the process is repeated again
#             if the word contains additional characters - the next character is kept
#             and "num" more characters are removed.  For example, if word="cZaYtU" and
#             num=1 the function will generate the following:
#        
#             cat (keeping character 0, removing character 1, keeping character 2, removing
#                  character 3, keeping character 4, removing character 5)
#
# output:     returns the newly unscrambed word


def remove_letters (word, num):

    #start with an empty string
    count=""

    #for loop for capturing the key letters
    for i in range(1,(len(word)+1)):
        if (i+num)%(int(num)+1) == 0:
            count=count+word[i-1]

    #return the string
    return count




# function:   shift_characters
# input:      a word (String) and a number of characters to shift (integer)
# processing: shifts each character in the supplied word to another position in the ASCII
#             table. the new position is dictated by the supplied integer.  for example,
#             if word = "apple" and num=1 the newly generated word would be:
#
#             bqqmf
#
#             because we added +1 to each character. if we were to call the function with
#             word = "bqqmf" and num=-1 the newly generated word would be:
#           
#             apple
#
#             because we added -1 to each character, which shifted each character down by
#             one position on the ASCII table.
#
# output:     returns the newly generated word

def shift_characters(word, num):

    #start an empty string
    count=""

    #for loop for capturing the key letters
    for i in word:
        count+= chr(ord(i)+ num)

    #return the string
    return count


        
        
