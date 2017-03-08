require('dplyr')
require('mlbench')

source('./RCode/artificialDataSetsNDims.R')
source('./RCode/KNNdataPrepAndGetResults.R')

dataSetNames <- artificialDataSetNDimsGetNames()

numIter <- 5
K <- 3

numTrainpoints <- c(1000, 3000, 5000, 7000, 9000, 11000)
numDims <- c(2,3,4,5)
trainRatio <- 0.5
numPoints <- round(numTrainpoints / trainRatio)

resultTable <- data.frame()
for(dataSet in dataSetNames){
    for(nDims in numDims){
        for(nPoints in numPoints){
            Data <- artificialDataSetNDims(dataSetName = dataSet, 
                                           nPoints = nPoints,
                                           nDims = nDims)
            X <- Data$x
            Y <- Data$classes
            
            for(iter in 1:numIter){
                Result <- KNNdataPrepAndGetResults(X = X, Y = Y, K = K,
                                                   trainPerc = trainRatio,
                                                   SEED = iter)
                
                cat(paste(Sys.time(), '\n',
                          'Iter = ', iter, '\t',
                          'DataSet = ', dataSet, '\t',
                          'NumDims = ', nDims, '\t',
                          'NumPoints = ', nPoints, '\n',
                          'trainningTime = ', Result$trainningTime, '\t',
                          'testingTime = ', Result$testingTime,
                          '\n', sep = ''))
                
                resultTable <- resultTable %>%
                    dplyr::bind_rows(data.frame(Iter = iter,
                                                DataSet = dataSet,
                                                NumDims = nDims,
                                                NumPoints = nPoints,
                                                trainningTime = Result$trainningTime,
                                                testingTime = Result$testingTime 
                    ))
                
                save.image('./Results/partialKNNTimeResults.RData')
            }
        }  
    }
}

save.image('./Results/KNNTimeResults.RData')
