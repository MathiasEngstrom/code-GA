#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J scaffold-11-maker2-SNAP
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load maker
cd /home/maen5548/genome-analysis-2019/analysis/maker2annotation/scaffold-11_pilon_corrected_2019-04-11.maker.output
hmm-assembler.pl /home/maen5548/genome-analysis-2019/data/derived-data/pilon_corrected_assembly/scaffold-11_pilon_corrected_2019-04-11.fasta . > scaffold-11_pilon_corrected_2019-04-11.hmm
