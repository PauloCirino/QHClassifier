import numpy as np
class QH:

    def __init__(self, nSplits):

        self.nClass = np.empty(0)
        self.nObs = np.empty(0)
        self.nFeatures = np.empty(0)

        self.Min = np.empty(0)
        self.Max = np.empty(0)
        self.minY = 0

        self.nSplits = nSplits

        self.QSize = np.empty(0)
        
        self.BFSMatix = np.empty(0)

        self.HashTable = {}

    def getKey(self, obs):
        key = str(np.floor( ( (obs - self.Min) / self.QSize) ).astype(int))
        return key

    def getRawKey(self, obs):
        key = np.floor( ( (obs - self.Min) / self.QSize) ).astype(int)
        return key

    def fit(self, X, Y):
        self.nClass = len(set(Y))
        self.nObs = X.shape[0]
        self.nFeatures = X.shape[1]

        self.BFSMatix = np.concatenate(     (np.identity(self.nFeatures),
                                             -1 * np.identity(self.nFeatures) ),
                                        axis = 0)
    
        self.Min = X.min(0) - 1e-8
        self.Max = X.max(0) + 3e-8

        self.minY = min(Y)

        Y = (Y - self.minY).astype(int)

        self.QSize = (self.Max - self.Min) / (2 ** self.nSplits)

        for i in range(self.nObs):
            obs = X[i, :]
            obsClass = Y[i]
            key = self.getKey(obs)

            if key not in self.HashTable :
                self.HashTable[key] = np.zeros(self.nClass)

            self.HashTable[key][obsClass] += 1
 
    def getAllRawNeighbourKeys(self, rawKey):
        rawNeigbouhoodKeys = self.BFSMatix + rawKey
        return rawNeigbouhoodKeys.astype(int)
 
    def BFS(self, Obs):
        foundKeysCount = 0 
        rawKey = self.getRawKey(Obs)
        activeRawKeys = self.getAllRawNeighbourKeys(rawKey)
        Ypred = np.zeros(self.nClass)
        while foundKeysCount == 0:
            for i in range(activeRawKeys.shape[0]):
                rawActiveKey = activeRawKeys[i, :]
                key = str(rawActiveKey)
                if key in self.HashTable:
                    Ypred += self.HashTable[key] / np.sum(self.HashTable[key])
                    foundKeysCount += 1
                        
            if foundKeysCount != 0:
                Ypred = Ypred / foundKeysCount
            else:
                newActiveKeys = np.zeros((2 *  self.nFeatures * activeRawKeys.shape[0], self.nFeatures))
                for i in range(activeRawKeys.shape[0]):
                    newActiveKeys[range((i)*(2*self.nFeatures), (i+1)*(2*self.nFeatures)), :] =  self.getAllRawNeighbourKeys(activeRawKeys[i, :])
                activeRawKeys = newActiveKeys.astype(int)
        return Ypred


    def predict(self, X, mode = 'prob'):

        if mode != 'prob' and mode != 'class':
            return 'Error'

        nObs = X.shape[0]
        Y = np.empty([nObs, self.nClass])
        for i in range(nObs):
            x = X[i, :]
            key = self.getKey(x)
            if key not in self.HashTable :
                #Y[i] = self.BFS(x)
                Y[i] = 1
            else :
                Y[i] = self.HashTable[key] / np.sum(self.HashTable[key])

        if mode == 'class':
            Y = np.argmax(Y, axis=1) + self.minY

        return Y
