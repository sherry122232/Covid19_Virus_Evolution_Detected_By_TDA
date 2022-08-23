library(streamMOA)
library(TDA)
library(ggplot2)


setwd("C:/Users/Administrator/Desktop/sd/microcluster")                                                                    #设定工作目录为D盘
a = list.files("csv1")  
dir = paste("./csv1/",a,sep="")   

n = length(dir)

for (i in 2:n){
  print(dir[n])
  stream <- DSD_ReadCSV(file =dir[n], header = TRUE)
  data <- read.csv(dir[n], header = TRUE)
  data <- data.matrix(data)
  
  # parameter setting
  ct <- DSC_ClusTree(horizon =300, maxHeight =8, lambda = NULL, k = NULL)
  maxDimension <- 2
  eps <- 0.3
  
  
  layout(matrix(c(1,2,2,3,4,4), nrow = 2, ncol = 3, byrow = TRUE))
  Diag1<-0
  wasserp2d01 <- numeric(9)
  streamProgress <- integer(9)
  
  for (i in 1:10) { 
    reset_stream(stream)
    update(ct, stream, 300) #update every 300 points
    centers <- data.matrix(na.omit(get_centers(ct, type = "micro")))
    print(stream)
    plot(centers)
    #plot(data[((i-1)*500 + 1):(i*500),], col = "azure3", xlim = c(-2, 2), ylim = c(-2, 2), pch = 16)
    points(centers, col = "coral", pch = 6)
    title(main = paste("Stream:", ((i-1)*300 + 1), "-", i*300))
    legend("topleft", inset = 0.01, legend = c("Data points", "Microcluster centers"), col = c("azure3", "coral"), pch = c(16,3), box.lty = 0)
    Diag <- ripsDiag(X = centers, maxDimension, eps, library = "GUDHI", printProgress = FALSE)
    
    
    #Compute the wasserstein distance
    if (i>1){
      wassersteinDist <- wasserstein(Diag1[["diagram"]], Diag[["diagram"]], p = 1,
                                     dimension = 1)
      wasserp2d01[i]<-wassersteinDist
      streamProgress[i]<-(i)*300
      print(wasserp2d01)
    }
    
    Diag1<-Diag
    
    dfp2d01 <- data.frame(
      stream = streamProgress,
      distance = wasserp2d01
    )
  
    #plot barcodes
    par(col.lab = "white")
    plot(Diag[["diagram"]], barcode = FALSE)
    par(col.lab = "black")
    title(main = paste("Barcodes at", i*300, "Points"), xlab = expression(epsilon))
    legend("bottomright", inset = 0.08, legend = c(expression(H[0]), expression(H[1])), col = c("black", "red"), lty = 1, lwd = 1.5, cex = 0.9, box.lty = 0)
  
    }
  
  update(ct, stream, 300)
  centers <- data.matrix(na.omit(get_centers(ct, type = "micro")))
  #print(nrow(centers))
  
  plot(data[1:3000,], col = "azure3", xlim = c(-2,2), ylim = c(-2, 2), pch = 16)
  points(centers, col = "coral", pch = 3)
  title(main = paste("Stream:", 1, "-", 5000))
  legend("topleft", inset = 0.01, legend = c("Data points", "Microcluster centers"), col = c("azure3", "coral"), pch = c(16,3), box.lty = 0)
  
  Diag <- ripsDiag(X = centers, maxDimension, eps, library = "GUDHI", printProgress = FALSE)
  
  par(col.lab = "white")
  plot(Diag[["diagram"]], barcode = FALSE)
  par(col.lab = "black")
  title(main = "Barcodes at 3500 Points", xlab = expression(epsilon))
  legend("bottomright", inset = 0.08, legend = c(expression(H[0]), expression(H[1])), col = c("black", "red"), lty = 1, lwd = 1.5, cex = 0.9, box.lty = 0)
  
  #plot wasserstein distance
  plot1 <- ggplot(dfp2d01, aes(x = stream, y = distance)) +
    geom_line(color = 'darkorchid4') +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 13)) +
    # scale_x_continuous(breaks = scales::pretty_breaks(n = 21)) +
    labs(x = "Progress of Stream", y = "0-dimensional 2nd Wasserstein Distance",
         title = "Wasserstein Distances between Pairs of Consecutive Persistence Diagrams")
  
  print(plot1)
  close_stream(stream)
}
