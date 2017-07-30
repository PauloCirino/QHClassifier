require('dplyr')
require('mlbench')

source('./RCode/artificialDataSetsNDims.R')
source('./RCode/KNNdataPrepAndGetResults.R')

dataSetNames <- artificialDataSetNDimsGetNames()

numIter <- 5
Ks <- c(3)

numTrainpoints <- c(500, 1000, 2500, 5000, 10000, 20000, 30000, 40000, 50000)
numDims <- c(2, 4, 8, 16)
trainRatio <- 0.5
numPoints <- round(numTrainpoints / trainRatio)

lastCheckPointTS <- 0
saveEachNSec <- 30

resultTableKNN <- data.frame()
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
                              'Method =', 'KNN', '\t',
                              'Param =', K, '\t',
                              'DataSet = ', dataSet, '\t',
                              'NumDims = ', nDims, '\t',
                              'NumPoints = ', nPoints, '\n',
                              'trainningTime = ', Result$trainningTime, '\t',
                              'testingTime = ', Result$testingTime,
                              '\n', sep = ''))
                    
                    resultTableKNN <- resultTableKNN %>%
                        dplyr::bind_rows(data.frame(Iter = iter,
                                                    Method = 'KNN',
                                                    Param = K, 
                                                    DataSet = dataSet,
                                                    NumDims = nDims,
                                                    NumPoints = nPoints,
                                                    trainningTime = Result$trainningTime,
                                                    testingTime = Result$testingTime 
                        ))
                    
                    if( (as.numeric( Sys.time() ) - lastCheckPointTS) > saveEachNSec ){
                        lastCheckPointTS <- as.numeric(Sys.time())
                        saveRDS(object = resultTableKNN,
                                file = './Results/partialKNNTimeResults.rds')
                    }
                }
            }  
        }
    }
}

saveRDS(object = resultTableKNN,
        file = './Results/KNNTimeResults.rds')
