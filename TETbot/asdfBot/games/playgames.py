
import time
import os
n = len(os.listdir())-1


while n > 0:
    with open('game-' + str(n) + '.txt', 'r') as f:
        lines = f.readlines()
    for line in lines:
        if line == '\n':
            time.sleep(.1)
        print(line, end='')
    n -= 1