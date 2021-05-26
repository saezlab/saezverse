BiocManager::install(c(
  "BiRewire",
  "CARNIVAL",
  "CellNOptR",
  "CNORdt",
  "CNORfeeder",
  "CNORfuzzy",
  "CNORode",
  "cosmosR",
  "decoupleR",
  "dorothea",
  "mistyR",
  "OmnipathR",
  "progeny",
  "wppi"
), ask = FALSE)

install.packages(
  'https://github.com/saezlab/PHONEMeS/raw/master/Package/PHONEMeS_0.2.7.tar.gz',
  repos = NULL
)

require(devtools)
devtools::install_github('saezlab/decoupleR')
devtools::install_github('saezlab/ocean')
BiocManager::install(c('BioNet', 'qvalue'), ask = FALSE)
devtools::install_github('saezlab/PHONEMeS-ILP')
devtools::install_github('saezlab/SLAPenrich')
