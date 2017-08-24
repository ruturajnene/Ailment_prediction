 diseasestand <- function(data){
  if (data == 1) {
    dis = rbind("Joint pain","Osteoarthritis(hands, knees, hips)","Thoracic outlet syndrome")
    
  }
  else if (data == 3){
    
    dis = rbind("Carotid atherosclerosis","Varicose veins", "Flat/ Protruding Chest(pectus carinatum/pigeon chest)")
  }
  
  else if(data == 2){
    dis = rbind("Shortened/contracted hamstrings","Poor hip flexion", "Tendonitis","Flat/ Protruding buttocks")
    
  }
  
  else if(data == 4){
   
    dis = rbind("Flat/ Protruding buttocks")
    
  }
  
  else{}
   
   return(dis)

 }
 
 diseasesit <- function(data){
   if (data == 4) {
     #mostsevere
     dis = rbind("Chronic back/neck pain","Kyphotic lower back","Cardiovascular and heart diseases","Improper digestion","Chest pain","Poor breathing")
     
   }
   else if (data == 1){
     
     dis = rbind("Loss of lordosis","Tension neck syndrome")
   }
   
   else if(data == 3){
     
     dis = rbind("hunchback","Shortened/contracted hamstrings", "Poor hip flexion","Muscle fatigue","Carpal Tunnel Syndrome&Text neck","Tendonitis")
     
     
   }
   
   else if(data == 2){
     #leastsevere
     dis = rbind("De Quervain's disease","Forward head","Rounded Shoulder")
     
   }
   
   else{}
   
   return(dis)
 }
 
 
 standtips<- function(data){
   
   if (data == 1) {
     tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/stand1.txt")
     
   }
   else if (data == 3){
     
    tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/stand2.txt")
   }
   
   else if(data == 2){
     tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/stand3.txt")
   
   }
   
   else if(data == 4){
     
   tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/stand4.txt")
     
   }
   
   else{}
   
   return(tip)
   
 }
 
 sittips<- function(data){
   
   if (data == 4) {
     #mostsevere
     tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/sit1.txt")
     
   }
   else if (data == 1){
     
     tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/sit2.txt")
   }
   
   else if(data == 3){
      tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/sit3.txt")
     
   }
   
   else if(data == 2){
     #leastsevere
   tip = readLines("D:/My files/VESIT/4th year/Project/PostMap/tips/sit4.txt")
     
   }
   else{}
   
   return(tip)
   
 }