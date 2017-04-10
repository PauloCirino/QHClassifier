source('./RCode/dataSets.R')
source('./RCode/QHdataPrepAndGetResults.R')
require('caret')
require('mlbench')
require('dplyr')
require('Metrics')

trainPerc <- 0.7
Qs <- c(1,2,3,4,5,6)
nFolds <- 10
nPoints <- 50000

DataSets <- list() 
DataSets$XOR <- mlbench::mlbench.xor(n = nPoints)
DataSets$Circle <- mlbench::mlbench.circle(n = nPoints)
DataSets$Normals2D <- mlbench::mlbench.2dnormals(n = nPoints)
DataSets$Cassini <- mlbench::mlbench.cassini(n = nPoints)
DataSets$Spirals <- mlbench::mlbench.spirals(n = nPoints, sd = 0.025)
DataSets$Circle3D <- mlbench::mlbench.circle(n = nPoints, d = 3)
DataSets$Simplex <- mlbench::mlbench.simplex(n = nPoints, d = 3)
DataSets$Smiley <- mlbench::mlbench.smiley(n = nPoints)

results <- data.frame()
for (dataSetName in names(DataSets)) {
    Data <- DataSets[[dataSetName]]
    X <- Data$x
    Y <- Data$classes %>% as.factor()
    for (q in Qs) {
        for (fold in 1:nFolds) {
            print(Sys.time())
            Msg <- cat('\tDataSet Name =', dataSetName,
                       '\n \tQ = ', q ,
                       '\n \tFold =', fold,
                       '\n')
            try{
                Result <- QHdataPrepAndGetResults(X = X, Y = Y, q = q,
                                                  trainPerc = trainPerc,
                                                  SEED = fold)
                
                Result <- Result$confusionMatrix
                accuracy <- round( 100 * Result$overall['Accuracy'], 2)
                kappa <- round(Result$overall['Kappa'], 4)
                results <- results %>%
                    dplyr::bind_rows(data.frame(DataSet = dataSetName,
                                                Q = q,
                                                fold = fold,
                                                Accuracy = accuracy,
                                                Kappa = kappa))
            }
        }
        save.image(file = './Results/Partial_QHResults.RData')
    }
}

save.image(file = './Results/QHPredictionResults.RData')
