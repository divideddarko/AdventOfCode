import re

with open('..\\input.txt') as file:
    lines = file.readlines()

def PartOne():
    position = 0
    results = 0

    for ele in lines:
        currentChar = ele[position]

        if currentChar == '#':
            results += 1

        positionToGo = position + 3
        
        if positionToGo >= 31:
            position = positionToGo - 31
        else:
            position = position + 3

    print("PartOne: " + str(results))


def PartTwo():
    finalResults = 1
    found = []
    numToCheck = [1,3,5,7,1]
    inter = 0

    for nTC in numToCheck:
        results = 0
        position = 0
        rowCount = 0

        for element in lines:
            if inter == 4 and (not(rowCount % 2 == 0)):
                rowCount = rowCount + 1
                continue
            
            currentChar = element[position]
            
            if currentChar == '#':
                results = results + 1

            positionToGo = int(position) + int(nTC)

            if positionToGo >= 31:
                position = int(positionToGo) - 31
            else:
                position = int(position) + int(nTC)

            rowCount = rowCount + 1

        inter = inter + 1
        found.append(results)

    for f in found:
        finalResults *= f

    print("PartTwo: " + str(finalResults))

PartOne()
PartTwo()