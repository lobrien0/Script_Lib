#!/usr/bin/env python

import hashlib as hasher          #Imports Hash libraries
from getpass import getpass       #Import a secure Input() function

password = hasher.md5()

# Prints out the Main Menu when called and takes input for selection
def mainMenu():
    print(f'Please Enter the Menu Selection:')
    print(f'\t[1]\tSet Password')
    print(f'\t[2]\tCheck Password')
    print(f'\t[3]\tExit')
    
    temp = input()
    print()
    if int(temp) == 1:
        setPassword()
        mainMenu()
    elif int(temp) == 2:
        checkPassword()
        mainMenu()
    elif int(temp) == 3:
        pass
    else:
        print(f'Invalid Option;\tTry again\n-----\n')
        mainMenu()

# Will set the password stored in the program
# Realisticly this would ship the hash to a database
def setPassword():
    password.update(getpass(f'Enter New Password\t').encode('utf-8'))
    print()

# Will has the value entered; then check the hash to that stored
def checkPassword():
    checkPW = hasher.md5((getpass(f'Enter Password\t\t').encode('utf-8')))
    print()
    if checkPW.hexdigest() == password.hexdigest():
        print(f'\tPassword Check Pass\n')
    else:
        print(f'\tPassword Check Fail!\n')
    print(f'Stored:\t\t{password.hexdigest()}\nEntered:\t{checkPW.hexdigest()}\n')

# Starts the program
mainMenu()
