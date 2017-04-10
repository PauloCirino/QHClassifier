require('dplyr')
require('mlbench')

source('./RCode/artificialDataSetsNDims.R')
source('./RCode/KNNdataPrepAndGetResults.R')

dataSetNames <- artificialDataSetNDimsGetNames()

numIter <- 10
Ks <- c(1,3,5,7)

numTrainpoints <- c(500, 1000, 3000, 5000, 7000, 9000, 11000, 13000, 15000)
numDims <- c(2)
trainRatio <- 0.5
numPoints <- round(numTrainpoints / trainRatio)

resultTable <- data.frame()
for(dataSet in dataSetNames){
    for(nDims in numDims){
        for(iter in 1:numIter){
            for(K in Ks){
                for(nPoints in numPoints){
                    Data <- artificialDataSetNDims(dataSetName = dataSet, 
                                                   nPoints = nPoints,
                                                   nDims = nDims)
                    X <- Data$x
                    Y <- Data$classes
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
}

save.image('./Results/KNNTimeResults.RData')
