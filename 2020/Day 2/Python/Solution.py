import re

with open('..\\input.txt') as file:
    lines = file.readlines()

def PartOne():
    wordsThatMatch = 0

    for a in lines:
        lowNum = int(a.split('-')[0])
        highNum = int((a.split('-')[1].split(' '))[0])
        charToFind = (((a.split(' '))[1]).split(':')[0])
        password = (a.split(": "))[1]

        charTotal = len(re.findall(charToFind, password))

        if charTotal >= lowNum and charTotal <= highNum:
            wordsThatMatch = wordsThatMatch + 1
        
    print("Found " + str(wordsThatMatch))

def PartTwo():
    wordsThatMatch = 0

    for a in lines:
        lowNum = int(a.split('-')[0])
        highNum = int((a.split('-')[1].split(' '))[0])
        charToFind = (((a.split(' '))[1]).split(':')[0])
        password = (a.split(": "))[1]
        found = 0

        positions = [x for x, v in enumerate(password) if v == charToFind]

        for p in positions:
            p = p + 1
            if p == lowNum or p == highNum:
                found = found + 1

        if found == 1:
            wordsThatMatch = wordsThatMatch + 1
        
    print("Found " + str(wordsThatMatch))

PartOne()
PartTwo()