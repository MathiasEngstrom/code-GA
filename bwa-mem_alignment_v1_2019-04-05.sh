#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J scaffold-11-assembly
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load bwa
# Your commands
bwa mem /home/maen5548/genome-analysis-2019/data/derived-data/scaffold-11_canu_assembly_2019-04-04 \
/home/maen5548/genome-analysis-2019/data/raw-data/illumina_data/SRR6058604_scaffold_11.1P.fastq.gz \
/home/maen5548/genome-analysis-2019/data/raw-data/illumina_data/SRR6058604_scaffold_11.2P.fastq.gz \
> /home/maen5548/genome-analysis-2019/data/derived-data/BWA/bwa-mem_alignment_scaffold-11_2019-04-05.sam
