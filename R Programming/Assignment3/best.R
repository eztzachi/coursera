best <- function(state, outcome) {
    ##init
    map<-new.env()
    map[["heart attack"]]<-11
    map[["heart failure"]]<-17
    map[["pneumonia"]]<-23
    
    ## Check that outcome valid
    outcomeCol = map[[outcome]]
    if (is.null(outcomeCol)){
        stop(" invalid outcome")
    }
    
    ## Read outcome data
    outcome <- read.csv("data/outcome-of-care-measures.csv", 
                        colClasses = "character")[, c(2,7,outcomeCol)]
    
    ## Check that state vaid
    x<-match(state,outcome$State)
    if(is.na(x)){
        stop("invalid state")
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    outcome<-outcome[outcome$State == state, ]
    suppressWarnings(outcome[,3] <- as.numeric(outcome[,3]))
    min<-min(outcome[,3],na.rm = TRUE)
    outcome<-outcome[outcome[,3] == min, ]
    outcome[order(outcome$Hospital.Name),][1,1]
}