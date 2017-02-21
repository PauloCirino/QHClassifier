source('./RCode/QHdataPrepAndGetResults.R')

require('mlbench')
Data <- mlbench::mlbench.xor(n = 100000, d = 2)
Result <- QHdataPrepAndGetResults(X = Data$x, Y = Data$classes, q = 5)

print(Result)