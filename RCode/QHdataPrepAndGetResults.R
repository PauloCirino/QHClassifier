require('caret')
source('./RCode/callQH.R')

# Example
# QHdataPrepAndGetResults(X = iris[, 1:4], Y = iris[, 5], q = 2)

QHdataPrepAndGetResults <- function(X, Y, q, trainPerc = 0.7, SEED = 1305){
    set.seed(SEED)
    
    Y <- as.numeric(Y)
    
    nObs <- length(Y)
    trainPos <- sample(nObs, round(trainPerc * nObs))
    
    Xtrain <- X[trainPos, ]
    Xtest <- X[-trainPos, ]
    
    Ytrain <- Y[trainPos]
    Ytest <- Y[-trainPos]
    
    resultList <- callQH(Xtrain = Xtrain, Ytrain = Ytrain, q = q, Xtest = Xtest)
    Ypred <- unlist(resultList[['Ypred']])
    trainningTime <- resultList[['trainningTime']]
    testingTime <- resultList[['testingTime']]
    
    confusionMatrix <- caret::confusionMatrix(Ypred, Ytest)
    
    list(confusionMatrix = confusionMatrix,
         trainningTime = trainningTime,
         testingTime = testingTime)
}
