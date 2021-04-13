with open('..\\input.txt') as file:
    lines = file.readlines()

for a in lines:
    for b in lines:
        c = int(a) + int(b)
        if c == 2020:
            results = int(a) * int(b)
            break
print('Part 1 : ' + str(results))

for a in lines:
    for b in lines:
        for c in lines:
            d = int(a) + int(b) + int(c)
            if d == 2020:
                r = int(a) * int(b) * int(c)
                break
print('Part 2 : ' + str(r))