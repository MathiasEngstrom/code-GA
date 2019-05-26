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
samtools view -S -b BWA-mem_scaffold-11_short_read_alignment_2019-04-05.sam > BWA-mem_scaffold-11_short_read_alignment_2019-04-05.bam

samtools sort BWA-mem_scaffold-11_short_read_alignment_2019-04-05.bam -o BWA-mem_scaffold-11_short_read_alignment_2019-04-05_sorted.bam

pilon --genome /home/maen5548/genome-analysis-2019/data/derived-data/scaffold-11_canu_assembly_2019-04-04/scaffold-11.contigs.fasta --bam /home/maen5548/genome-analysis-2019/data/derived-data/BWA/BWA-mem_scaffold-11_short_read_alignment_2019-04-05_sorted.bam --diploid --threads 4 --output /home/maen5548/genome-analysis-2019/data/derived-data/pilon_corrected_assembly/scaffold-11_pilon_corrected_2019-04-11.fasta
