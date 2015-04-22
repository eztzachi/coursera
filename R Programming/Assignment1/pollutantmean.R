pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  files <- list.files(directory, full.names = TRUE)
  total_length <- 0
  for (i in id){
    total_length <- total_length + length(read.csv(files[i])[[pollutant]])
  }
  all_values <- numeric(total_length)
  counter <- 1
  for (i in id){
    df<-read.csv(files[i])[[pollutant]]
    all_values[counter:(counter+length(df)-1)]<-df
    counter <- counter + length(df)
  }
  mean(all_values, na.rm = TRUE)
}
