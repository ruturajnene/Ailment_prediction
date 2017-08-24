#pm1-pca value
#pmcluster1-kmeanclusters formed
#x1-centers of clusters
#pmcenter- reconstructedcenter
library(proxy)

#pca
pca<-function(data){
  pm<- prcomp(data,center = TRUE,scale. = FALSE)
  return(pm)
}


  #kmeans_sit
k_mean1<-function(pm){
  set.seed(40)
  pmCluster <- kmeans(pm$x,4)
  return(pmCluster)
}

#kmeans_stand
k_mean2<-function(pm){
  set.seed(40)
  pmCluster <- kmeans(pm$x,3)
  return(pmCluster)
}


#reconstructcentersfrompca
reconCen<-function(pm,pmCluster){
  pcs<-NULL
  if(is.null(pcs)) pcs <- seq(pm$sdev)
  pmcenter <- as.matrix(pmCluster$centers[,pcs]) %*% t(as.matrix(pm$rotation[,pcs]))
  if(pm$scale[1] != FALSE){
    pmcenter <- scale(pmcenter , center=FALSE, scale=1/pm$scale)
  }
  if(pm$center[1] != FALSE){
    pmcenter <- scale(pmcenter , center=-pm$center, scale=FALSE)
  }
  return(pmcenter) 
}


predictDis<-function(pm,pmCluster,input){
  
  nm <- rownames(pm$rotation)
  colnames(input)<-as.matrix(nm)
  #inputpca
  ip<-predict(pm,input)
  
  #eucledian distance for each input
  d1<-NULL
  d1<-dist(ip,pmCluster$centers)
  
  return(d1)
}

swagRatio<-function(dist1,dist2,input1,input2){
  hrs_sit<-48
  hrs_stand<-34
  dist_tot<-dist1+dist2 #14.3
  sit_val<-sum(input1[,4:11])-20
  stand_val<-sum(input2[,4:8])
  sit<-(sit_val/hrs_sit)*(dist1/dist_tot)
  stand<-(stand_val/hrs_stand)*(dist2/dist_tot)
  Z<-rbind(sit,stand)
  return(Z)
}