import numpy as np
import sys
import time
from QHModule import QH

def main():

    if len(sys.argv) != 6:
        raise ValueError('Unexpected number of imputs')

    [XtrainFileName, YtrainFileName, q, XtestFileName, YpredFileName] = sys.argv[1:]

    try:
        Xtrain = np.genfromtxt(XtrainFileName, delimiter = ',', skip_header = 1)
        Ytrain = np.genfromtxt(YtrainFileName, delimiter = ',', skip_header = 1)
        Xtest = np.genfromtxt(XtestFileName, delimiter = ',', skip_header = 1)
        q = int(q)
    except:
        raise('Error reading files')

    t0 = time.time()
    auxQH = QH(q)
    auxQH.fit(Xtrain, Ytrain)
    predY = auxQH.predict(Xtest, mode = 'class')
    t1 = time.time()

    np.savetxt(YpredFileName, predY, delimiter = ",")

    return round(t1 - t0, 4)

if __name__ == "__main__":
    main()









