artificialDataSetNDims <- function(dataSetName, nPoints, nDims = 2, seed = 123){
    set.seed(seed)
    switch (dataSetName,
            'Circle' = mlbench::mlbench.circle(n = nPoints, d = nDims),
            'Corners' = mlbench::mlbench.corners(n = nPoints, nDims),
            'XOR' = mlbench::mlbench.xor(n = nPoints),
            'Simplex' = mlbench.simplex(n = nPoints, d = nDims, center = FALSE),
            'Cassini' = mlbench.cassini(n = nPoints), 
            'Normals2D' = mlbench.2dnormals(n = nPoints), 
            'Smiley' = mlbench.smiley(n = nPoints), 
            'Spirals' = mlbench.spirals(n = nPoints)
    )
}
dataSetNames <- c('Cassini', 'Normals2D', 'Smiley', 'Spirals', 'XOR')

artificialDataSetNDimsGetNames <- function(){
    c('Circle',
      'Simplex',
      'XOR')
}

