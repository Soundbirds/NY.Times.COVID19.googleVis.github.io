
# Run the mainloop using rgit::S(). (The git app needs to configured for 'Soundbirds' user.)
if(FALSE) {
      
library(JRWToolBox)
JRWToolBox::lib(rgit, attach = FALSE)

rgit::S(mainLoop, gitPath = 'Soundbirds/NY.Times.COVID19.googleVis.github.io/master/', viewOnly = TRUE, run = TRUE)
      
}





mainLoop <- function() {
    
   JRWToolBox::lib(rgit)
   JRWToolBox::lib(googleVis)
   JRWToolBox::lib(RCurl)
   
   while(TRUE) {
   
       # Initial setup (replace with your personal GitHub account and URL info)
       setwd("C:/Users/Public")
       system(paste0("rm -r -f ", "NY.Times.COVID19.googleVis.github.io")) # Make sure this directory is deleted
       
       # Download function and scripts from GitHub (you will be asked once for your password, if you are not already logged into GitHub).
       rgit::git("config --global user.name 'John Wallace'")
       rgit::git("config --global user.email 'soundbirds@gmail.com'")
       rgit::git("clone https://github.com/Soundbirds/NY.Times.COVID19.googleVis.github.io.git")
       
       # Run functions in R, downloading new state and county data from the NYT repo, and creating new html's using the googleVis package
       setwd("C:/Users/Public/NY.Times.COVID19.googleVis.github.io")
       source('gVisCOVID.NYT.Data.R')
       try(gVisCOVID.NYT.Data(width = 1400, height = 800, Print = TRUE))  # States
       try(gVisCOVID.NYT.Data(c('Washington', 'New York', 'Michigan'), width = 1400, height = 800, Print = TRUE))  # Counties within the listed states (too many states is slow)
       #  gVisCOVID.NYT.Data(width = 1400 * 1.5, height = 800 * 1.5, Print = FALSE)  # For interactive plotting to large screens
       
       # Push the updated html back to Github
       rgit::git('add COVID_counties.htm')
       rgit::git('add COVID_states.htm')
       rgit::git('add index.htm')
       rgit::git('commit --amend --no-edit')  
       rgit::git('push -u -v --force origin master')
       
       setwd("C:/Users/Public/")
       system(paste0("rm -r ", "NY.Times.COVID19.googleVis.github.io"))
       timestamp()
      
       # Pause the given hours until the process is repeated
       hoursPause <- 2  # Hours to pause; gives the time that has elapsed every 30 minutes
       cat("\n\nStarting to pause for", hoursPause, "hours\n")
       
       for(i in 1:(hoursPause * 2)) {
          Sys.sleep(30 * 60)
          cat("\n\n", round((i * 30)/60, 3), "hours out of", hoursPause, "hours have passed\n")
          timestamp()
       }
   }   
}
