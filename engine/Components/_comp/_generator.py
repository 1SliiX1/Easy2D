import os

path = os.path.dirname(os.path.realpath(__file__))
dir = os.listdir(path)

dat = open(path+'.dat', 'w+')

for i in range(len(dir)):
    if dir[i] != '_generator.py':
        dat.write(dir[i] + '\n')

dat.close()