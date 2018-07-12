 myAvgMerge <- function(m,lo,hi){
   for (i in 1:lo-1){
    m[lo,i]<-(m[lo,i]+m[hi,i])/2
   }
   for (i in (lo+1):dim(m)[1]){
     if (i > hi){
       m[i,lo]<-(m[i,lo]+m[i,hi])/2
     }
     else{
       m[i,lo]<-(m[i,lo]+m[hi,i])/2
     }
   }
   for (i in 1:dim(m)[1]){
     if (i < hi){
       m[hi,i]<-0
     }
     else{
       m[i,hi]<-0
     }
   } 
   return(m)
}

 myMinMerge <- function(m,lo,hi){
   for (i in 1:lo-1){
    m[lo,i]<-min(m[lo,i],m[hi,i])
   }
   for (i in (lo+1):dim(m)[1]){
     if (i > hi){
       m[i,lo]<-min(m[i,lo],m[i,hi])
     }
     else{
       m[i,lo]<-min(m[i,lo],m[hi,i])
     }
   }
   for (i in 1:dim(m)[1]){
     if (i < hi){
       m[hi,i]<-0
     }
     else{
       m[i,hi]<-0
     }
   } 
   return(m)  
 }

 myMaxMerge <- function(m,lo,hi){
   for (i in 1:lo-1){
    m[lo,i]<-max(m[lo,i],m[hi,i])
   }
   for (i in (lo+1):dim(m)[1]){
     if (i > hi){
       m[i,lo]<-max(m[i,lo],m[i,hi])
     }
     else{
       m[i,lo]<-max(m[i,lo],m[hi,i])
     }
   }
   for (i in 1:dim(m)[1]){
     if (i < hi){
       m[hi,i]<-0
     }
     else{
       m[i,hi]<-0
     }
   } 
   return(m)  
 }