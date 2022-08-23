library(ape)

#concate of aligned sequence
leftAligned<-read.dna('flu/H1N1-D-concate.fas',format='fasta')
rightAligned<-read.dna('flu/H4N6-d-concate.fas',format='fasta')

concat<-cbind(leftAligned,rightAligned,check.names = FALSE)  

write.dna(concat,'flu/fluconcat.fa',format='fasta')