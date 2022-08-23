# Covid19_Virus_Evolution_Detected_By_TDA

### Author:  
Shuyang Wang && Xiaomi Zhao  

### Abstract:  
During the domestic coronavirus outbreak, as the quick evolution of the new mutation of viruses, how to effectively detect and analyze the evolution of coronavirus with high accuracy was a source of great concern. The Microcluster model, as a general topological data analyzing framework, was proposed in this project to detect and analyze SARS-COV-2 viruses’ evolution. Based on this model, topological features were effectively extracted and analyzed in evolving streams of SARS-COV-2 viruses’ genetic sequences. The results provided guidelines to analyze virus's evolutions and also showed high efficiency and wide usage for analyzing streams based on topological data analysis. 

### DataBase:  
[gisaid.org](https://www.gisaid.org)  
https://www.ncbi.nlm.nih.gov/  

### Usage:  

1. Download the original dataset from gisaid/NCBI website.(original_dataset)
2. Formatting the DNA data into single line:
  Two ways:
	Use the software mega11 to open the fasta file and then export to .fas(ta).
	Use the fasta_formatter -i BA2.fa(official file) -t -o BA2.fasta (only in linux)

3. Use segmentation.py to cut the sequence (Optional).

4. Merge the fasta file. Here, we analyze AY.4 and BA.1. So the BA.1.fasta is all copied to AY.4.fasta.

5. Use mafft online tool (https://mafft.cbrc.jp/alignment/software/closelyrelatedviralgenomes.html) to do the alignment.
    	Note: to set the reference sequence. Here, one AY.4 virus's sequence was set as reference. 

6. Check whether the length of the fasta file (output of the mafft alignment) is the same or not. If true, go to matlab to compute the pairwise matrix(compute_pairwise_distance_matrix.m), get the matlab_result.csv.

7. Trim the matlab_result.csv
   PCA requires the square dimension, therefore we cut from (0,0) to (3776,3776) in matlab_result.csv to make a ay4.csv and cut from (3777,0) to (7392,3615) to make ba1.csv.

8. Doing the PCA(mds.R) method seperately by the above csv files. Outputs are ay4_mds.csv, ba1_mds.csv

9. Merge ay4_mds.csv(at the beginning), ba1_mds.csv(end) to merge1.csv

10. Run the Main.R

### Sample results:  

![image](https://user-images.githubusercontent.com/45084681/186265560-7d9204d3-dd59-4580-a2df-5910847f5a73.png)

![image](https://user-images.githubusercontent.com/45084681/186264748-8994504f-2984-45a8-add9-2dd905394f96.png)
![image](https://user-images.githubusercontent.com/45084681/186265030-32a974d6-5c00-4c84-8c08-93c5155f9113.png)

