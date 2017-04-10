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
    ggplot2::ggsave(filename = './pics/data.png',
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
    ggplot2::ggsave(filename = './pics/grid.png',
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
    ggplot2::ggsave(filename = './pics/dataClass2.png',
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
    ggplot2::ggsave(filename = './pics/dataClass3.png',
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
    ggplot2::ggsave(filename = './pics/dataClass4.png',
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
    ggplot2::ggsave(filename = './pics/dataClass5.png',
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
    ggplot2::ggsave(filename = './pics/dataProb1.png',
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
    ggplot2::ggsave(filename = './pics/dataProb2.png',
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
    ggplot2::ggsave(filename = './pics/dataProb3.png',
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
    ggplot2::ggsave(filename = './pics/dataProb4.png',
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
    ggplot2::ggsave(filename = './pics/dataProb5.png',
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