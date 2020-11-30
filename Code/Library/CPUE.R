##################################################
# CPUE Function
##' 1) Calculate the Julian date for each year
##' 2) Calculate Effort [soak time * no. of pots]
##' 3) Calculate CPUE [Total crabs / effort]
##################################################

CPUE <- function(data){
  
#   # Making a Julian date by the year 
#   data$J.date <- julian.Date(data$Date, as.Date("2013-01-01"), by= 'Year' )
#   for (i in 1:nrow(data)){
#     if(data$Year[i] != 2013) {
#       n = data$Year[i] - 2013;
#       data$J.date[i] <- data$J.date[i] - (365 * n) 
#     }  
#   }
#   # estimating CPUE
#   data <- data %>% 
#     mutate(Effort = Soak.Time.hr * Total.pots) %>%
#     mutate(CPUE = Total.crabs / Effort)
# }
  
  # Jess' version

  # assuming that data is a dataframe or tibble
  # create new variable/col in the table that has the year day (number of dats since the start of the year)
  
  # note the difference between as.date and as_date, the former is base R, the latter tidyverse
  # (_ is always a good way to know if its a tidyverse function)
  
  # mutate will apply the function row by row, so that removes the for loop
  # yday does everthing in rows 3-9
  
  data <- data %>% mutate(J.Date = yday(as_date(Date)))
  
  # estimating CPUE
  data <- data %>% 
    mutate(Effort = Soak.Time.hr * Total.pots) %>%
    mutate(CPUE = Total.crabs / Effort)
  
  }

