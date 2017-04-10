import numpy as np
import sys
import time
from QHModule import QH

def main():

    if len(sys.argv) != 7:
        raise ValueError('Unexpected number of imputs')

    [XtrainFileName, YtrainFileName, q, XtestFileName, YpredFileName, qhMode] = sys.argv[1:]

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
    t1 = time.time()
    predY = auxQH.predict(Xtest, mode = qhMode)
    t2 = time.time()

    np.savetxt(YpredFileName, predY, delimiter = ",")
    
    logYpredFileName = str(YpredFileName).replace(".csv", ".log")
    ColNames = 'TrainningTime, TestingTime'
    Times = str(round(t1-t0, 4)) + ' ' + str(round(t2-t1, 4))
    file = open(logYpredFileName, "w")
    file.write(ColNames + '\n' + Times + '\n') 
    file.close()
    
    return 1

if __name__ == "__main__":
    main()
    








