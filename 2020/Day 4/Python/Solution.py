import re

with open('..\\input.txt') as file:
    lines = file.readlines()
    
def checkID(passportID, correct = False):
    if 'pid' in passportID and 'iyr' in passportID and 'eyr' in passportID and 'hgt' in passportID and 'hcl' in passportID and 'ecl' in passportID and 'byr' in passportID:
        correct = True
        return correct

    return correct

def checkIDDetails (passportID, correct = False):
    newStringArray = passportID.split(' ')

    pid, iyr, eyr, hgt, byr, hcl, ecl = False, False, False, False, False, False, False

    for item in newStringArray:
        print("Working on " + item)
        if 'pid' in item and len(item) == 13:
            pid = True
        if 'iyr' in item and int(item.split(':')[1]) >= 2010 and int(item.split(':')[1]) <= 2020 and len(item) == 8:
            iyr = True
        if 'eyr' in item and int(item.split(':')[1]) >= 2020 and int(item.split(':')[1]) <= 2030 and len(item) == 8:
            eyr = True
        if 'hgt' in item and 'in' in item and int(re.split("\D", item)[4]) >= 59 and int(re.split("\D", item)[4]) <= 76:
            hgt = True
        elif 'hgt' in item and 'cm' in item and int(re.split("\D", item)[4]) >= 150 and int(re.split("\D", item)[4]) <= 193:
            hgt = True
        if 'hcl' in item and re.search("#[aA-fF0-9]{6}", item):
            hcl = True
        eyes = ("amb", "blu", "brn", "gry", "grn", "hzl", "oth")
        if 'ecl' in item and item.split(':')[1] in eyes:
            ecl = True
        if 'byr' in item and int(item.split(':')[1]) >= 1920 and int(item.split(':')[1]) <= 2002 and len(item) == 8:
            byr = True

        if pid and iyr and eyr and hgt and hcl and ecl and byr:
            
            return True

    return correct


def PartOne():
    results = 0
    newInput = ""

    for ele in lines:
        if ele.isspace() == True:
            correct = checkID(newInput.strip())

            if correct:
                results += 1

            newInput = ""

        else:
            newInput = str(newInput) + " " + str(ele.strip())

    print("Found " + str(results))
        
def PartTwo():
    results = 0
    newInput = ""

    for ele in lines:
        if ele.isspace() == True:
            correct = checkIDDetails(newInput.strip())

            if correct:
                results += 1

            newInput = ""

        else:
            newInput = str(newInput) + " " + str(ele.strip())
    
    print("Found " + str(results))


PartOne()
PartTwo()