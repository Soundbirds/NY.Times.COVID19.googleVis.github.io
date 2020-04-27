
Data visualization of the NY Times COVID-19 data (https://github.com/nytimes/covid-19-data) via R code using the googleVis package (https://github.com/mages/googleVis). With GitHub, the git app, and R coding the website is automatically updated with new NY Times data at an interval set in the 'mainloop.R' script.

Browser requirements:

The browser needs to allow the Adobe Flash player to run, Firefox and Opera both make this an easy 2 clicks with clear prompting.
    
For Chrome, click on the lock icon to the left of the URL, change the 'Flash' to 'Allow' via the pull down menu, click outside of the lock icon box, and click 'Reload'.  If that doesn't work or the lock icon isn't available see: https://support.google.com/chrome/answer/6258784?co=GENIE.Platform%3DDesktop&hl=en
    
   
The website for the state data is updated daily (17" or larger screen recomended): https://soundbirds.github.io/NY.Times.COVID19.googleVis.github.io/COVID_states.htm
 
- Single left mouse click on a circle to select (or unselect) a state, or select the states manually from the list. 
- The playback speed can be adjusted using the dial immediately to the right of the play button. 
- Hovering the mouse curser over any point will show all the data for that point.
- Hovering the mouse curser over the name of selected state hightlights the last point in that time series.
- Try changing both the x and y axis to log scale.
- Note that the x-variable can be switched to 'Time' after loading into the web browser is completed (googleVis hangs if xvar starts with the timevar).

After installing the necessary libraries from CRAN, the state data can be interactively plottted using the gVisCOVID.NYT.Data() function, adjust the width and height to your screen:


      install.packages(c('googleVis, 'RCurl', 'housingData'))      
      gVisCOVID.NYT.Data()
      
      # For smaller screens reduce the width and height
      gVisCOVID.NYT.Data(width = 700, height = 400)
     

The website for the county data is updated daily here: https://soundbirds.github.io/NY.Times.COVID19.googleVis.github.io/COVID_counties.htm

the county data can be interactively plottted by listing the states in the gVisCOVID.NYT.Data() function, adjust the width and height to your screen.

For the county data, selecting too many states may be slow. 

Note, that I have added extra unique codes to the fips (Federal Information Processing Standards) unique county codes since they are missing for the added cities (e.g. New York) and unknown county within a state.



      # install.packages(c('googleVis, 'RCurl', 'housingData'))   
      
      gVisCOVID.NYT.Data(c('Washington', 'New York', 'Michigan'))
      
      
      
    
P.S. Hans Rosling used the precursor of googleVis in an amazing Ted talk from 2006:
    https://www.youtube.com/watch?v=RUwS1uAdUcI
    

"In 2006 Hans Rosling gave an inspiring talk at
TED about social and economic developments
in the world over the past 50 years, which challenged the views and
perceptions of many listeners. Rosling had used extensive data analysis
to reach his conclusions.  To visualise his talk, he and his team at
Gapminder had developed animated bubble charts, aka
motion charts, see Figure. 

Rosling's presentation popularised the idea and use of interactive
charts. One year later the software behind
Gapminder was bought by Google and integrated as motion charts into
their Google Charts API, formerly known as Google
Visualisation API."
    https://github.com/mages/googleVis/blob/master/vignettes/googleVis.Rnw
    
    
    
     
     

