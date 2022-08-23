
"""
This file is to only use the c numbers of sequences
Author Shuyang Wang
"""

f=open('seg-ay4align.fasta', 'r') #input: single line
fw=open('seg-ay4align_part.fasta', 'w') #output
c=0
for line in f.readlines():
    if c>300: #set the number
        break
    if line.startswith('>'):
        c = c + 1
        if c<=300:
            fw.write(line)
    else:
        # print(line[21562:25383])
        fw.write(line) #from 21563 to 25384 (spike)
        # fw.write('\r')
f.close()
fw.close()