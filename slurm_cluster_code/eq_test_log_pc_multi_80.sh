#!/bin/sh

#SBATCH --job-name=t_glog_80_multi_dep

#SBATCH --error=t_glog_80_multi_dep%j.err

#SBATCH --output=t_glog_80_multi_dep%j.out


# SBATCH -p BigMem

#SBATCH -t 15-00:00 # walltime request D-HH:MM

#SBATCH -n 28

#SBATCH -N 1

#SBATCH --array=0-10 # run the simulation this many times

module load gcc/6.1.0
module load R/gcc/3.6.0

Rscript  --vanilla ~/hdi_simu/pc_test_glasso_multi_log_80.R 100 80 500 500 log_new_alter_glasso_multi_beta05_80_pc_hdi_simu_dep ${SLURM_ARRAY_TASK_ID}
# Rscript  --vanilla ~/hdi_path/power_simu.R 100 1000 500 500 L2.squared lars de-sparse lars_de  ${SLURM_ARRAY_TASK_ID}
# Rscript  --vanilla ~/hdi_path/power_simu.R 100 1000 500 500 L2.squared lars Truth lars_Truth  ${SLURM_ARRAY_TASK_ID}
