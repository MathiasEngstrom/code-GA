#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J scaffold-11_pilon_correction
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load samtools
# Your commands
samtools 
