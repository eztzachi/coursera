rankhospital <- function(state, outcome, num = "best") {
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
    
    ## Check that state and outcome are valid
    x<-match(state,outcome$State)
    if(is.na(x)){
        stop("invalid state")
    }
    
    ## Return hospital name in that state with the given rank 30-day death rate
    outcome<-outcome[outcome$State == state, ]
    suppressWarnings(outcome[,3] <- as.numeric(outcome[,3]))
    outcome<-outcome[complete.cases(outcome),]
    outcome<-outcome[order(outcome[,3],outcome[,1]),]
    
    size<-nrow(outcome)
    ret<-""
    if (num == "best"){
        ret<-outcome[1,1]
    }
    else if (num == "worst"){
        ret<-outcome[size,1]
    }
    else if (num>size || size==0){
        ret<-NA
    }
    else {
        ret<-outcome[num,1]
    }
    ret
}