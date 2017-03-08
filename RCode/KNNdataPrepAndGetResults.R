require('caret')
source('./RCode/callKNN.R')

# Example
# KNNdataPrepAndGetResults(X = iris[, 1:4], Y = iris[, 5], K = 4)

KNNdataPrepAndGetResults <- function(X, Y, K, trainPerc = 0.7, SEED = 1305){
    set.seed(SEED)
    
    Y <- as.numeric(Y)
    
    nObs <- length(Y)
    trainPos <- sample(nObs, round(trainPerc * nObs))
    
    Xtrain <- X[trainPos, ]
    Xtest <- X[-trainPos, ]
    
    Ytrain <- Y[trainPos]
    Ytest <- Y[-trainPos]
    
    resultList <- callKNN(Xtrain = Xtrain, Ytrain = Ytrain, K = K, Xtest = Xtest)
    Ypred <- unlist(resultList[['Ypred']])
    trainningTime <- resultList[['trainningTime']]
    testingTime <- resultList[['testingTime']]
    
    confusionMatrix <- caret::confusionMatrix(Ypred, Ytest)
    
    list(confusionMatrix = confusionMatrix,
         trainningTime = trainningTime,
         testingTime = testingTime)
}
