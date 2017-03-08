artificialDataSetNPoints <- function(dataSetName, nPoints, seed = 123){
    set.seed(seed)
    switch (dataSetName,
            'Circle' = mlbench::mlbench.circle(n = nPoints, d = 2),
            '2Nroms' = mlbench::mlbench.2dnormals(n = nPoints),
            'Spirals' = mlbench::mlbench.spirals(n = nPoints, cycles = 3, sd = 0.06),
            'Corners' = mlbench::mlbench.corners(n = nPoints, 2),
            'XOR' = mlbench::mlbench.xor(n = nPoints),
            'Cassini' = mlbench::mlbench.cassini(n = nPoints)
    )
}

artificialDataSetNPointsGetNames <- function(){
    c('Circle',
      '2Nroms',
      'Spirals',
      'Corners',
      'XOR',
      'Cassini')
}

