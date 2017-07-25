import numpy as np
from scipy.spatial.distance import cdist
from scipy.stats import mode

class KNN:
    def __init__(self, X, Y):
        self.Xtrain = X
        self.Ytrain = Y
    
    def predict(self, X, K):
        yPred = np.zeros(X.shape[0])
        
        for i in range(X.shape[0]):
            xTest = np.array([X[i, :]])
            Dist = cdist(xTest, self.Xtrain)
            kPos = (Dist.argsort()[0, ])[:K]
            yPred[i] = mode(self.Ytrain[kPos])[0][0]
        
        return yPred