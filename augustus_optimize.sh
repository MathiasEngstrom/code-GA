#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J scaffold-11-augustus-optimize
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load maker
cd /home/maen5548/genome-analysis-2019/analysis/maker2annotation/scaffold-11_from_paper.maker.output/scaffold-11_from_paper.hmm
perl optimize_augustus.pl --species=arabidopsis augustus.gbk.train --AUGUSTUS_CONFIG_PATH=/home/maen5548/genome-analysis-2019/analysis/maker2annotation/config

