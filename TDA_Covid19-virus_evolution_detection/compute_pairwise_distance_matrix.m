concatSeq3=fastaread('ay4-1.fasta');
D=seqpdist(concatSeq3,'squareForm',true);
disp(size(D))
csvwrite('ay4-1.csv',D(1:4406,1:4406))
csvwrite('ba1-1.csv',D(4407:4407+4320,1:1+4320))