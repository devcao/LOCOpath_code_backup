#!/bin/sh

#SBATCH --job-name=beta19_screen_20_100

#SBATCH --error=beta19_screen_20_100%j.err

#SBATCH --output=beta19_screen_20_100%j.out


# SBATCH -p BigMem

#SBATCH -t 15-00:00 # walltime request D-HH:MM

#SBATCH -n 28

#SBATCH -N 1

#SBATCH --array=0-4 # run the simulation this many times

module load R/gcc/3.6.0


Rscript  --vanilla ~/hdi_simu/rate_screen.R 20 100 200 ${SLURM_ARRAY_TASK_ID}
