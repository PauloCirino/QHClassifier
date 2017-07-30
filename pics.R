require('mlbench')
require('ggplot2')
require('plotly')
library('colorspace')
require('xtable')

source('./RCode/QHdataPrepAndGetResults.R')

if(! dir.exists('./pics') ) dir.create('./pics')

Data <- mlbench::mlbench.circle(n = 5000)
X <- Data$x
Y <- as.numeric(Data$classes)
auxData <- data.frame(X1 = X[, 1], X2 = X[, 2], Class = factor(Y))

ggplot2::ggplot(data = auxData, 
                aes(x = X1, y = X2,
                    color = Class)) + 
    ggplot2::geom_point() +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::scale_x_continuous(name = 'X') + 
    ggplot2::scale_y_continuous(name = 'Y') +
    ggplot2::ggsave(filename = './pics/data.eps', device = 'eps',
                    width = 8, height = 8)

################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
ggplot2::ggplot(data = auxData, 
                aes(x = X1, y = X2,
                    color = Class)) + 
    ggplot2::geom_point() +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_line(color = 'black', size = 1),
                    panel.grid.minor = element_line(color = 'black', size = 1),
                    axis.line = element_line(colour = "white")) +
    ggplot2::scale_x_continuous(minor_breaks = seq(-1, 1, 0.25),
                                breaks = seq(-1, 1, 0.5),
                                name = 'X') + 
    ggplot2::scale_y_continuous(minor_breaks = seq(-1, 1, 0.25),
                                breaks = seq(-1, 1, 0.5),
                                name = 'Y') +
    ggplot2::ggsave(filename = './pics/grid.eps', device = 'eps',
                    width = 8, height = 8)

################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
Xtest <- expand.grid(seq(from = min(X[,1]), to = max(X[,1]), by = 0.01),
                     seq(from = min(X[,2]), to = max(X[,2]), by = 0.01))

result <- callQH(Xtrain = X, Ytrain = Y, q = 2, Xtest = Xtest,
                 qhMode = 'class')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 = Xtest[,2],
                       Class = factor(result$Ypred$V1) )
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, fill = Class)) +
    ggplot2::geom_tile() +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataClass2.eps', device = 'eps',
                    width = 8, height = 8)


result <- callQH(Xtrain = X, Ytrain = Y, q = 3, Xtest = Xtest,
                 qhMode = 'class')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 = Xtest[,2],
                       Class = factor(result$Ypred$V1) )
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, fill = Class)) +
    ggplot2::geom_tile() +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataClass3.eps', device = 'eps',
                    width = 8, height = 8)

result <- callQH(Xtrain = X, Ytrain = Y, q = 4, Xtest = Xtest,
                 qhMode = 'class')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 = Xtest[,2],
                       Class = factor(result$Ypred$V1) )
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, fill = Class)) +
    ggplot2::geom_tile() +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataClass4.eps', device = 'eps',
                    width = 8, height = 8)

result <- callQH(Xtrain = X, Ytrain = Y, q = 5, Xtest = Xtest,
                 qhMode = 'class')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 = Xtest[,2],
                       Class = factor(result$Ypred$V1) )
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, fill = Class)) +
    ggplot2::geom_tile() +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataClass5.eps', device = 'eps',
                    width = 8, height = 8)


################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################

Xtest <- expand.grid(seq(from = min(X[,1]), to = max(X[,1]), by = 0.01),
                     seq(from = min(X[,2]), to = max(X[,2]), by = 0.01))

result <- callQH(Xtrain = X, Ytrain = Y, q = 1, Xtest = Xtest,
                 qhMode = 'prob')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 =  Xtest[,2],
                       Y = result$Ypred$V1)
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, z = Y, fill = Y)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient(limits=c(0, 1),
                                 low = "#F67670",
                                 high = "#1FBEC2",
                                 guide = guide_legend(title = "Prob.") ) +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataProb1.eps', device = 'eps',
                    width = 8, height = 8)


result <- callQH(Xtrain = X, Ytrain = Y, q = 2, Xtest = Xtest,
                 qhMode = 'prob')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 =  Xtest[,2],
                       Y = result$Ypred$V1)
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, z = Y, fill = Y)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient(limits=c(0, 1),
                                 low = "#F67670",
                                 high = "#1FBEC2",
                                 guide = guide_legend(title = "Prob.") ) +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataProb2.eps', device = 'eps',
                    width = 8, height = 8)


result <- callQH(Xtrain = X, Ytrain = Y, q = 3, Xtest = Xtest,
                 qhMode = 'prob')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 =  Xtest[,2],
                       Y = result$Ypred$V1)
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, z = Y, fill = Y)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient(limits=c(0, 1),
                                 low = "#F67670",
                                 high = "#1FBEC2",
                                 guide = guide_legend(title = "Prob.") ) +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataProb3.eps', device = 'eps',
                    width = 8, height = 8)


result <- callQH(Xtrain = X, Ytrain = Y, q = 4, Xtest = Xtest,
                 qhMode = 'prob')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 =  Xtest[,2],
                       Y = result$Ypred$V1)
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, z = Y, fill = Y)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient(limits=c(0, 1),
                                 low = "#F67670",
                                 high = "#1FBEC2",
                                 guide = guide_legend(title = "Prob.") ) +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataProb4.eps', device = 'eps',
                    width = 8, height = 8)


result <- callQH(Xtrain = X, Ytrain = Y, q = 5, Xtest = Xtest,
                 qhMode = 'prob')
resultDF <- data.frame(X1 = Xtest[,1],
                       X2 =  Xtest[,2],
                       Y = result$Ypred$V1)
ggplot2::ggplot(data = resultDF, aes(x = X1, y = X2, z = Y, fill = Y)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient(limits=c(0, 1),
                                 low = "#F67670",
                                 high = "#1FBEC2",
                                 guide = guide_legend(title = "Prob.") ) +
    ggplot2::xlab(label = 'X') + ggplot2::ylab(label = 'Y') +
    ggplot2::xlim(min = -1, max = 1) + ggplot2::ylim(min = -1, max = 1) +
    ggplot2::theme_bw() + 
    ggplot2::theme( panel.border = element_blank(),
                    panel.grid.major = element_blank(),
                    panel.grid.minor = element_blank(),
                    axis.line = element_line(colour = "white")) +
    ggplot2::ggsave(filename = './pics/dataProb5.eps', device = 'eps',
                    width = 8, height = 8)

################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################

auxDataQH <- readRDS(file = './Results/QHAccuracyResults.rds') %>%
    dplyr::filter( ! (Q %in% 1 )) %>%
    dplyr::mutate(Method = paste('QH-', Q, sep = '') ) %>%
    dplyr::group_by(DataSet, Method) %>%
    dplyr::summarise(medAccuracy = median(Accuracy),
                     meanAccuracy = mean(Accuracy)) %>%
    dplyr::ungroup() %>%
    data.frame()
    
auxDataKNN <- readRDS(file = './Results/KNNAcurracyResults.rds') %>%
    dplyr::mutate(Method = paste('KNN-', K, sep = '') ) %>%
    dplyr::group_by(DataSet, Method) %>%
    dplyr::summarise(medAccuracy = median(Accuracy),
                     meanAccuracy = mean(Accuracy)) %>%
    dplyr::ungroup() %>%
    data.frame()

accuracyResults <- dplyr::bind_rows(auxDataKNN, auxDataQH) %>%
    dplyr::select(-medAccuracy)

endTableDF <- data.frame(row.names = unique(accuracyResults$Method))
for(dataSetName in unique(accuracyResults$DataSet)){
    auxData <- accuracyResults %>%
        dplyr::filter(DataSet == dataSetName)
    
    partialDF <- data.frame(X = auxData$meanAccuracy)
    colnames(partialDF) <- dataSetName
    rownames(partialDF) <- auxData$Method
    endTableDF <- dplyr::bind_cols(endTableDF, partialDF)
}
rownames(endTableDF) <- unique(accuracyResults$Method)

xtable::xtable(endTableDF)

################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################


require('dplyr')
require('ggplot2')

KNNTimeTable <- readRDS('Results/KNNTimeResults.rds')
QHTImeTable <- readRDS('Results/QHTimeResults.rds')

timeTable <- dplyr::bind_rows(KNNTimeTable, QHTImeTable) %>%
    dplyr::mutate(totalTime = trainningTime + testingTime)

timeTable %>%
    dplyr::filter(NumDims == 16, DataSet == 'Circle') %>%
    dplyr::mutate(Method = paste(Method, Param)) %>%
    dplyr::group_by(NumPoints, Method) %>%
    dplyr::summarise(trainningTime = mean(trainningTime),
                     testingTime = mean(testingTime),
                     totalTime = mean(totalTime)) %>%
    ggplot2::ggplot(aes(x = NumPoints,
                        y = totalTime,
                        color = Method) ) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::theme_bw() +
    ggplot2::xlab('Número de Pontos') +
    ggplot2::ylab('Tempo Total - Segundos')

knnTable <- timeTable %>%
    dplyr::filter(Method == 'KNN') %>% 
    dplyr::filter(NumDims == 16, DataSet == 'Circle') %>%
    dplyr::summarise(trainningTime = mean(trainningTime),
                     testingTime = mean(testingTime),
                     totalTime = mean(totalTime)) 

timeTable %>%
    dplyr::filter(NumDims == 16, DataSet == 'Circle', Method != 'KNN') %>%
    dplyr::mutate(Method = paste(Method, Param)) %>%
    dplyr::group_by(NumPoints, Method) %>%
    dplyr::summarise(trainningTime = mean(trainningTime),
                     testingTime = mean(testingTime),
                     totalTime = mean(totalTime)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(totalTime = totalTime / knnTable$totalTime) %>%
    ggplot2::ggplot(aes(x = NumPoints,
                        y = totalTime,
                        color = Method) ) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::theme_bw() +
    ggplot2::xlab('Número de Pontos') +
    ggplot2::ylab('Tempo Total - Segundos')


timeTable %>%
    dplyr::filter(NumPoints == 1e+04, DataSet == 'Circle') %>%
    dplyr::mutate(Method = paste(Method, Param)) %>%
    dplyr::group_by(NumDims, Method) %>%
    dplyr::summarise(trainningTime = mean(trainningTime),
                     testingTime = mean(testingTime),
                     totalTime = mean(totalTime)) %>%
    ggplot2::ggplot(aes(x = NumDims,
                        y = totalTime,
                        color = Method)) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::theme_bw()



timeTable %>%
    dplyr::filter(NumDims == 2, DataSet == 'Circle', Method == 'QH') %>%
    dplyr::mutate(Method = paste(Method, Param)) %>%
    dplyr::group_by(NumPoints, Method) %>%
    dplyr::summarise(trainningTime = mean(trainningTime),
                     testingTime = mean(testingTime),
                     totalTime = mean(totalTime)) %>%
    ggplot2::ggplot(aes(x = NumPoints,
                        y = totalTime,
                        color = Method) ) +
    ggplot2::scale_y_log10() +
    ggplot2::geom_line() + 
    ggplot2::geom_point() +
    ggplot2::theme_bw() 


auxTable <- timeTable %>%
    dplyr::mutate(Method = paste(Method, Param)) %>%
    dplyr::group_by(NumPoints, NumDims, Method) %>%
    dplyr::summarise(trainningTime = mean(trainningTime),
                     testingTime = mean(testingTime),
                     totalTime = mean(totalTime))

#### Teste Anova
auxDataQH <- readRDS(file = './Results/QHAccuracyResults.rds') %>%
    dplyr::filter( ! (Q %in% 1 )) %>%
    dplyr::mutate(Param = Q, Method = 'QH') %>%
    dplyr::group_by(DataSet, Method, Param) %>%
    dplyr::summarise(medAccuracy = median(Accuracy),
                     meanAccuracy = mean(Accuracy)) %>%
    dplyr::ungroup() %>%
    data.frame()

auxDataKNN <- readRDS(file = './Results/KNNAcurracyResults.rds') %>%
    dplyr::mutate(Param = K, Method = 'KNN') %>%
    dplyr::group_by(DataSet, Method, Param) %>%
    dplyr::summarise(medAccuracy = median(Accuracy),
                     meanAccuracy = mean(Accuracy)) %>%
    dplyr::ungroup() %>%
    data.frame()

accuracyResults <- dplyr::bind_rows(auxDataKNN, auxDataQH) %>%
    dplyr::select(-medAccuracy) %>%
    dplyr::mutate(Param = paste(Method, Param, sep = '-'))

aov(formula = as.numeric(meanAccuracy) ~ factor(DataSet) + factor(Method) + factor(Param), 
    data = accuracyResults) %>%
    summary() %>%
    xtable()
