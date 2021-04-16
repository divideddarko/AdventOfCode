import time

with open('..\\input.txt') as file:
    lines = [int(v) for v in file]
    # lines = file.readlines()

def time_convert(sec):
    mins = sec // 60
    sec = sec % 60
    hours = mins // 60
    mins = mins % 60
    print ("Time Lapsed = {0}:{1}:{2}".format(int(hours),int(mins),sec))

start_Time = time.time()
for a in lines:
    for b in lines:
        c = a + b
        if c == 2020:
            results = a * b
            end_Time = time.time()
            final_Time = end_Time - start_Time
            break
print('Part 1 : ' + str(results))
time_convert(final_Time)

start_Time = time.time()
for a in lines:
        toFind = 2020 - a
        if toFind in lines:
            resultsa = a * toFind
            end_Time = time.time()
            final_Time = end_Time - start_Time            
            break
print('Part 1B : ' + str(resultsa))
time_convert(final_Time)

# Part 2
start_Time = time.time()
for a in lines:
    for b in lines:
        for c in lines:
            d = a + b + c
            if d == 2020:
                r = a * b * c
                end_Time = time.time()
                final_Time = end_Time - start_Time
                break
print('Part 2 : ' + str(r))
time_convert(final_Time)

# Part B imp
start_Time = time.time()
for a in lines:
        for b in lines:
            toFind = 2020 - a - b
            if toFind in lines:
                rb2 = a * b * toFind
                end_Time = time.time()
                final_Time = end_Time - start_Time
                break
print('Part 2B : ' + str(rb2))
time_convert(final_Time)