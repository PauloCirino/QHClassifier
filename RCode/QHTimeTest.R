require('dplyr')
require('mlbench')

source('./RCode/artificialDataSetsNDims.R')
source('./RCode/QHdataPrepAndGetResults.R')

#dataSetNames <- artificialDataSetNDimsGetNames()
dataSetNames <- c('Cassini', 'Normals2D', 'Smiley', 'Spirals', 'XOR')

numIter <- 5
Qs <- c(2, 3, 4, 5, 6, 7)

numTrainpoints <- c(500, 1000, 2500, 5000, 10000, 20000, 30000, 40000, 50000)
numDims <- 2
trainRatio <- 0.5
numPoints <- round(numTrainpoints / trainRatio)

lastCheckPointTS <- 0
saveEachNSec <- 600

resultTableQH <- data.frame()
for(dataSet in dataSetNames){
    for(nDims in numDims){
        for(iter in 1:numIter){
            for(Q in Qs){
                for(nPoints in numPoints){
                    Data <- artificialDataSetNDims(dataSetName = dataSet, 
                                                   nPoints = nPoints,
                                                   nDims = nDims)
                    X <- Data$x
                    Y <- Data$classes
                    Result <- QHdataPrepAndGetResults(X = X, Y = Y, q = Q,
                                                       trainPerc = trainRatio,
                                                       SEED = iter)
                    
                    cat(paste(Sys.time(), '\n',
                              'Iter = ', iter, '\t',
                              'Method =', 'QH', '\t',
                              'Param =', Q, '\t',
                              'DataSet = ', dataSet, '\t',
                              'NumDims = ', nDims, '\t',
                              'NumPoints = ', nPoints, '\n',
                              'trainningTime = ', Result$trainningTime, '\t',
                              'testingTime = ', Result$testingTime,
                              '\n', sep = ''))
                    
                    resultTableQH <- resultTableQH %>%
                        dplyr::bind_rows(data.frame(Iter = iter,
                                                    Method = 'QH',
                                                    Param = Q,
                                                    DataSet = dataSet,
                                                    NumDims = nDims,
                                                    NumPoints = nPoints,
                                                    trainningTime = Result$trainningTime,
                                                    testingTime = Result$testingTime
                        ))
                    
                    if( (as.numeric( Sys.time() ) - lastCheckPointTS) > saveEachNSec ){
                        lastCheckPointTS <- as.numeric(Sys.time())
                        saveRDS(object = resultTableQH,
                                file = './Results/partialQHTimeResults.rds')
                    }
                }
            }  
        }
    }
}

saveRDS(object = resultTableQH,
        file = './Results/QHTimeResults.rds')
