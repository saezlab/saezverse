library(remotes)

options(repos = c(CRAN = "https://cloud.r-project.org"))

# Saez R tools from Bioconductor
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

# Saez R tools from GitHub
remotes::install_github("saezlab/ocean", repos = BiocManager::repositories())
remotes::install_github("saezlab/PHONEMeS-ILP")
remotes::install_github("saezlab/SLAPenrich", repos = BiocManager::repositories())
remotes::install_github("saezlab/liana")
remotes::install_github("saezlab/DOT")
remotes::install_github("saezlab/OmnipathR")

