.libPaths(new="~/R")

rm(list=ls())

setwd("~/hdi_simu")
source("path_power.R")
source("screen_simu.R")
require(mvnfast)
require(LOCOpath)

print(depenDesign)
#######################################################################################################################################
# Set simulation parameters (to be done with command-line arguments)

# Execute this from within the directory containing this R script:
############################################################################


options(echo=TRUE)

args <- commandArgs(trailingOnly = TRUE)

print(args)

# args <- c("1000","2","1","20","3","5","3",".92",".96",".95",".98","1")

n <- as.numeric(args[1])

p <- as.numeric(args[2])

iter <- as.numeric(args[3])

beta_i = as.numeric(args[4])
###################################################
###################################################
###################################################
#if (beta_i == 0){
#  rho = 0
#}else if (beta_i == 1){
#  rho = 0.1
#}else if (beta_i == 2){
#  rho = 0.5
#}else if (beta_i == 3){
#  rho = 0.9
#}else{
#  stop('wrong input')
#}

beta_i = beta_i + 1
cat("n=", n, 'p=', p, 'beta=', beta_i, '\n' )

results = list()
results$rho01 = screen_simu(n = n, p = p, signal = beta_i, rho = 0.1, iter = iter)

results$rho09 = screen_simu(n = n, p = p, signal = beta_i, rho = 0.9, iter = iter)
results$rho00 = screen_simu(n = n, p = p, signal = beta_i, rho = 0, iter = iter)

results$rho05 = screen_simu(n = n, p = p, signal = beta_i, rho = 0.5, iter = iter)


f1 = paste0("~/hdi_simu/results/", "var_ar_19_beta_", beta_i, '_n_', n, '_p_', p, ".RData")

save(results,file = f1)




