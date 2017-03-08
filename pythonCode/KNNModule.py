import numpy as np
from scipy.spatial import distance
from scipy.stats import mode

class KNN:
    def __init__(self, X, Y):
        self.Xtrain = X
        self.Ytrain = Y
    
    def predict(self, X, K):
        yPred = np.zeros(X.shape[0])
        
        for i in range(X.shape[0]):
            xTest = X[i, :]
            Dist = np.zeros(self.Xtrain.shape[0])
            
            for j in range(self.Xtrain.shape[0]):
                xTrain = self.Xtrain[j, :]
                Dist[j] = distance.euclidean(xTrain, xTest)
            
            kPos = Dist.argsort()[:K]
            
            yPred[i] = mode(self.Ytrain[kPos])[0][0]
        
        return yPred