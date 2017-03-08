source('./RCode/dataSets.R')
source('./RCode/QHdataPrepAndGetResults.R')
require('caret')
require('dplyr')
require('Metrics')

trainPerc <- 0.7
Qs <- c(2, 3, 4, 5, 6, 7, 8, 9)
nFolds <- 10

results <- data.frame()
for (dataSetName in names(DataSets)) {
    Data <- DataSets[[dataSetName]]
    X <- Data$X
    Y <- Data$Y %>% as.factor()
    for (q in Qs) {
        for (fold in 1:nFolds) {
            print(Sys.time())
            Msg <- cat('\tDataSet Name =', dataSetName,
                       '\n \tQ = ', q ,
                       '\n \tFold =', fold,
                       '\n')
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
        save.image(file = './Results/Partial_QHResults.RData')
    }
}
#file.remove(file = './Results/Partial_QHResults.RData')
save.image(file = './Results/QHPredictionResults.RData')
