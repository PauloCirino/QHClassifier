callKNN <- function(Xtrain, Ytrain, K, Xtest){
    if(!dir.exists('./data')) dir.create('./data')
    
    if(file.exists('data/auxXtrain.csv')) file.remove('data/auxXtrain.csv')
    if(file.exists('data/auxYtrain.csv')) file.remove('data/auxYtrain.csv')
    if(file.exists('data/auxXtest.csv')) file.remove('data/auxXtest.csv')
    if(file.exists('data/auxYpred.csv')) file.remove('data/auxYpred.csv')
    
    write.csv(x = Xtrain, file = 'data/auxXtrain.csv', row.names = FALSE)
    write.csv(x = Ytrain, file = 'data/auxYtrain.csv', row.names = FALSE)
    write.csv(x = Xtest, file = 'data/auxXtest.csv', row.names = FALSE)
    
    shellCommand <- paste('python',
                          './pythonCode/KNNShellScript.py',
                          './data/auxXtrain.csv',
                          './data/auxYtrain.csv',
                          K,
                          './data/auxXtest.csv',
                          './data/auxYpred.csv',
                          sep = ' ')
    
    TimeSpent <- system(command = shellCommand)
    file.remove(file = 'data/auxXtrain.csv')
    file.remove(file = 'data/auxYtrain.csv')
    file.remove(file = 'data/auxXtest.csv')
    
    Ypred = read.csv('data/auxYpred.csv', header = FALSE)
    file.remove('data/auxYpred.csv')
    
    timeTable <- read.table('./data/auxYpred.log', header = TRUE)
    file.remove('./data/auxYpred.log')
    
    trainningTime <- timeTable[1,1]
    testingTime <- timeTable[1,2]
        
    list(Ypred = Ypred,
         trainningTime = trainningTime,
         testingTime = testingTime)
    
}