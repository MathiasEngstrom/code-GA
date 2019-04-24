#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J scaffold-11-top_hat_align_sort
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load samtools
for file in /home/maen5548/genome-analysis-2019/data/derived-data/top_hat_transcript_alignment/*
do
	output=$(basename $file)
	samtools sort $file/accepted_hits.bam -o /home/maen5548/genome-analysis-2019/data/derived-data/transcriptome_alignment_sorted/accepted_hits_sorted_2019-04-24_$output.bam
done
