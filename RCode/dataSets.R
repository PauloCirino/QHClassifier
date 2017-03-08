require('mlbench')
require('datasets')
require('AppliedPredictiveModeling')
require('dplyr')

DataSets <- list()

set.seed(123)
auxDf <- mlbench::mlbench.2dnormals(n = 10000)
DataSets[['2Nroms']] <-
    list(X = auxDf$x %>%
             data.matrix() %>% scale(),
         Y = as.numeric(auxDf$classes))
################################################################################

set.seed(123)
auxDf <- mlbench::mlbench.spirals(n = 10000, cycles = 3, sd = 0.06)
DataSets[['Spirals']] <-
    list(X = auxDf$x %>%
             data.matrix() %>% scale(),
         Y = as.numeric(auxDf$classes))
################################################################################

DataSets[['Iris']] <- list(
    X = iris %>% select(-Species) %>%
        data.matrix() %>% scale(),
    Y = iris %>% select(Species) %>%
        unlist() %>% as.numeric()
)
################################################################################

data(BreastCancer)
BreastCancer <- BreastCancer[complete.cases(BreastCancer), ]
DataSets[['BreastCancer']] <- list(
    X = BreastCancer %>% select(-Id, -Class) %>%
        data.matrix() %>% scale(),
    Y = BreastCancer %>% select(Class) %>%
        unlist() %>% as.numeric()
)
rm(BreastCancer)
################################################################################

data(Glass)
Glass <- Glass[complete.cases(Glass), ]
DataSets[['Glass']] <- list(
    X = Glass %>%
        select(-Type) %>%
        data.matrix() %>% scale(),
    Y = Glass %>% select(Type) %>%
        unlist() %>% as.numeric()
)
rm(Glass)
################################################################################

data(Ionosphere)
Ionosphere <- Ionosphere[complete.cases(Ionosphere), ]
DataSets[['Ionosphere']] <- list(
    X = Ionosphere %>% select(-Class, -V2) %>%
        data.matrix() %>% scale(),
    Y = Ionosphere %>% select(Class) %>%
        unlist() %>% as.numeric()
)
rm(Ionosphere)
################################################################################

data(PimaIndiansDiabetes)
PimaIndiansDiabetes <- PimaIndiansDiabetes[complete.cases(PimaIndiansDiabetes), ]
DataSets[['Diabetes']] <-
    list(
        X = PimaIndiansDiabetes %>% select(-diabetes) %>%
            data.matrix() %>% scale(),
        Y = PimaIndiansDiabetes %>%
            select(diabetes) %>%
            unlist() %>% as.numeric()
    )
rm(PimaIndiansDiabetes)
################################################################################

data(abalone)
abalone <- abalone[complete.cases(abalone), ]
DataSets[['Abalone']] <- list(
    X = abalone %>% select(-Type) %>%
        data.matrix() %>% scale(),
    Y = abalone %>%
        select(Type) %>%
        unlist() %>% as.numeric()
)
rm(abalone)
################################################################################

data(LetterRecognition)
LetterRecognition <- LetterRecognition[complete.cases(LetterRecognition), ]
DataSets[['LetterRecognition']] <-
    list(
        X = LetterRecognition %>% select(-lettr) %>%
            data.matrix() %>% scale(),
        Y = LetterRecognition %>%
            select(lettr) %>%
            unlist() %>% as.numeric()
    )
rm(LetterRecognition)
################################################################################

data(Vowel)
Vowel <- Vowel[complete.cases(Vowel), ]
DataSets[['Vowel']] <- list(
    X = Vowel %>% select(-Class) %>%
        data.matrix() %>% scale(),
    Y = Vowel %>%
        select(Class) %>%
        unlist() %>% as.numeric()
)
rm(Vowel)
################################################################################

rm(auxDf)
