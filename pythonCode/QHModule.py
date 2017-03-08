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

        self.HashTable = {}

    def getKey(self, obs):
        key = str(np.floor( ( (obs - self.Min) / self.QSize) ).astype(int))
        return key

    def fit(self, X, Y):
        self.nClass = len(set(Y))
        self.nObs = X.shape[0]
        self.nFeatures = X.shape[1]

        self.Min = X.min(0) - 1e-8
        self.Max = X.max(0) + 1e-8

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


    def predict(self, X, mode = 'prob'):

        if mode != 'prob' and mode != 'class':
            return 'Error'

        nObs = X.shape[0]
        Y = np.empty([nObs, self.nClass])
        for i in range(nObs):
            x = X[i, :]
            key = self.getKey(x)
            if key not in self.HashTable :
                Y[i] = np.repeat(0.5, self.nClass)
            else :
                Y[i] = self.HashTable[key] / np.sum(self.HashTable[key])

        if mode == 'class':
            Y = np.argmax(Y, axis=1) + self.minY

        return Y


