callQH <- function(Xtrain, Ytrain, q, Xtest){
    
    if(file.exists('data/auxXtrain.csv')) file.remove('data/auxXtrain.csv')
    if(file.exists('data/auxYtrain.csv')) file.remove('data/auxYtrain.csv')
    if(file.exists('data/auxXtest.csv')) file.remove('data/auxXtest.csv')
    if(file.exists('data/auxYpred.csv')) file.remove('data/auxYpred.csv')
    
    write.csv(x = Xtrain, file = 'data/auxXtrain.csv', row.names = FALSE)
    write.csv(x = Ytrain, file = 'data/auxYtrain.csv', row.names = FALSE)
    write.csv(x = Xtest, file = 'data/auxXtest.csv', row.names = FALSE)
    
    shellCommand <- paste('python',
                          './pythonCode/QHShellScript.py',
                          './data/auxXtrain.csv',
                          './data/auxYtrain.csv',
                          q,
                          './data/auxXtest.csv',
                          './data/auxYpred.csv',
                          sep = ' ')
    
    TimeSpent <- system(command = shellCommand)
    
    
    Ypred = read.csv('data/auxYpred.csv', header = FALSE)
    file.remove('data/auxYpred.csv')
    
    list(Ypred = Ypred,
         timeSpent = TimeSpent)

}