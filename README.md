# Covid19_Virus_Evolution_Detected_By_TDA

### Author:  
Shuyang Wang && Xiaomi Zhao  

### Abstract:  
During the domestic coronavirus outbreak, as the quick evolution of the new mutation of viruses, how to effectively detect and analyze the evolution of coronavirus with high accuracy was a source of great concern. The Microcluster model, as a general topological data analyzing framework, was proposed in this project to detect and analyze SARS-COV-2 viruses’ evolution. Based on this model, topological features were effectively extracted and analyzed in evolving streams of SARS-COV-2 viruses’ genetic sequences. The results provided guidelines to analyze virus's evolutions and also showed high efficiency and wide usage for analyzing streams based on topological data analysis. 

### DataBase:  
[gisaid.org](https://www.gisaid.org)  
https://www.ncbi.nlm.nih.gov/  



### Background:

#### 1. TDA and Persistent homology    
   TDA is a method for examining the "shape" or topology of data to obtain meaningful information, which could detect topological changes with both accuracy and speed and contribute greatly to the biomedical field, like cancer diagnosis. 
     
   Besides, Persistent homology [3], one of the most common algorithms used along with TDA, is a robust and powerful tool for data analysis that performs multi-scale analysis on a set of points and identifies clusters, holes, and voids therein. Given a set of data points, persistent homology computes a set of intervals or lifespans of certain topological structures. The topological structures and their lifespans enable the segregation of meaningful patterns from noise and often lead to the discovery of insight not discernible by conventional methods of data mining. The capabilities of persistent homology come at the cost of its high space complexity that grows exponentially with the number of input data points.
  
#### 2. Data dimension reduction based on PCA algorithm  
  
   Multidimensional scaling takes a set of dissimilarities and returns a set of points such that the distances between the points are approximately equal to the dissimilarities.   
     
   Translate the pairwise distances to vectors in a d-dimensional Euclidean space using Classical Multidimensional Scaling (MDS) [12], also known as Principal Coordinates Analysis (PCoA). For the experiments in the previous subsections, the value of d was empirically chosen to be 45 that provided a good trade-off between the run time and the value of the loss function that MDS aims to minimize.  


### Algorirhms:
![image](https://user-images.githubusercontent.com/45084681/196342305-fa92b622-be62-474a-b29e-9978e80cfbb3.png)



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

![image](https://user-images.githubusercontent.com/45084681/196342524-551ebd32-21c0-4c7a-9433-b8ea6cc7e172.png)
![image](https://user-images.githubusercontent.com/45084681/196342533-376338ac-bd81-459f-862e-073bfda61ba2.png)
![image](https://user-images.githubusercontent.com/45084681/196342538-f3117057-50cb-462e-b8c2-ab7d683ca3b8.png)
![image](https://user-images.githubusercontent.com/45084681/196342557-4e90cc58-f5db-4c2e-9bf7-a5ffa7b8e6ae.png)

