artificialDataSetNDims <- function(dataSetName, nPoints, nDims, seed = 123){
    set.seed(seed)
    switch (dataSetName,
            'Circle' = mlbench::mlbench.circle(n = nPoints, d = nDims),
            'Corners' = mlbench::mlbench.corners(n = nPoints, nDims),
            'XOR' = mlbench::mlbench.xor(n = nPoints, d = nDims)
    )
}

artificialDataSetNDimsGetNames <- function(){
    c('Circle',
      'Corners',
      'XOR')
}

