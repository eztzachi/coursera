rankall <- function(outcome, num = "best") {
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
    
    ## For each state, find the hospital of the given rank
    state<-c()
    hospital<-c()
    allStates<-unique(outcome$State)
    allStates<-sort(allStates)
    for (st in allStates){
        state<-c(state, st)
        out<-outcome[outcome$State == st, ]
        suppressWarnings(out[,3] <- as.numeric(out[,3]))
        out<-out[complete.cases(out),]
        out<-out[order(out[,3],out[,1]),]
        size<-nrow(out)
        ret<-""
        if (num == "best"){
            ret<-out[1,1]
        }
        else if (num == "worst"){
            ret<-out[size,1]
        }
        else if (num>size || size==0){
            ret<-NA
        }
        else {
            ret<-out[num,1]
        }
        hospital<-c(hospital,ret)
    }
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data.frame(state, hospital)
}