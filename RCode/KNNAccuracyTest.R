source('./RCode/dataSets.R')
require('class')
require('caret')
require('dplyr')
require('Metrics')

trainPerc <- 0.7
Ks <- c(1,3,5,7)
nFolds <- 10
nPoints <- 50000

DataSets <- list() 
DataSets$XOR <- mlbench::mlbench.xor(n = nPoints)
DataSets$Circle <- mlbench::mlbench.circle(n = nPoints)
DataSets$Normals2D <- mlbench::mlbench.2dnormals(n = nPoints)
DataSets$Cassini <- mlbench::mlbench.cassini(n = nPoints)


Results <- data.frame()
for (dataSetName in names(DataSets)) {
    Data <- DataSets[[dataSetName]]
    X <- Data$x 
    Y <- Data$classes %>% as.factor()
    for (K in Ks) {
        for (fold in 1:nFolds) {
            print(Sys.time())
            Msg <- cat('\tDataSet Name =', dataSetName,
                       '\n \tK = ', K ,
                       '\n \tFold =', fold,
                       '\n')
            
            set.seed(fold)
            
            trainPos <- sample(length(Y), round(0.7 * length(Y)))
            
            XTrain <- X[trainPos,]
            YTrain <- Y[trainPos]
            
            XTest <- X[-trainPos,]
            YTest <- Y[-trainPos]
            
            YPred <- knn(
                train = XTrain,
                test = XTest,
                cl = YTrain,
                k = K,
                prob = TRUE
            )
            
            results <- caret::confusionMatrix(data = YPred, reference = YTest)
            accuracy <- round( 100 * results$overall['Accuracy'], 2)
            kappa <- round(results$overall['Kappa'], 4)
            Results <- Results %>%
                dplyr::bind_rows(data.frame(DataSet = dataSetName,
                                            K = K,
                                            fold = fold,
                                            Accuracy = accuracy,
                                            Kappa = kappa))
        }
    save.image(file = './Results/Partial_KNNResults.RData')
    }
}
file.remove(file = './Results/Partial_KNNResults.RData')
save.image(file = './Results/KNNPredictionResults.RData')
