#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 18:00:00
#SBATCH -J job_name
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load canu
# Your commands
canu \
-p scaffold-11 -d /home/maen5548/genome-analysis-2019/data/derived-data/scaffold-11_canu_assembly_2019-04-04 \
genomeSize=37m \
correctedErrorRate=0.035 \
-pacbio-raw /home/maen5548/genome-analysis-2019/data/raw-data/pacbio_data/SRR6037732_scaffold_11.fq.gz
