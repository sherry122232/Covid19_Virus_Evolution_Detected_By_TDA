"""
Author: Shuyang Wang
This file is to do the segmentation [21562:25383]
Before using, you should use fasta_formatter -i BA2.fa(official file) -t -o BA2.fasta to make it to single line
"""

f=open('newdata/B1_617_2.fas', 'r') #input: single line
fw=open('newdata/B1_617_2-cut.fasta', 'w') #output
for line in f.readlines():
    if line.startswith('>'):
        fw.write(line)
    else:
        # print(line[21562:25383])
        fw.write(line[21562:25383]) #from 21563 to 25384 (spike)
        fw.write('\r')
f.close()
fw.close()

