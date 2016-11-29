#I am an experienced R user, but am starting to get into Python. This is a running list of the frustrations and/or translations, where I think "I know exactly how to do this in R, what is the equivalent function?!! #$%@"
setwd("C:\\Users\\Scott\\Google Drive\\R Projects\\R to Python")
R_to_Py <- read.csv("R_to_Python_Dictionary.csv", stringsAsFactors = FALSE)

search_R <- function(R_function, dictionary = R_to_Py){
  # dictionary <- R_to_Py
  # R_function <- "data_frame"
  lev_distance <- adist(R_function, 
                        dictionary$R_object, 
                        partial = TRUE)
  closest_match_index <- which(lev_distance == min(lev_distance))
  python_help <- dictionary[closest_match_index,]$Python_Equivalent
  if(lev_distance %>% min() == 0){
    return(python_help)
  } else {
    answer <- readline(prompt = paste("Is this equivalent to: ", 
                            dictionary[closest_match_index,]$R_object, 
                            "? ",
                            " [y/n]",
                            sep = "")
                       )
    if(answer == "y"){
      return(python_help)
    } else if(answer == "n"){
      #give another suggestion: to do in the future
      print("well then that's a problem...")
    }
  }
}

search_R(R_function = "data_.fre")
