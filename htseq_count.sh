#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J scaffold-11-htseq
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load htseq/0.9.1
for file in /home/maen5548/genome-analysis-2019/data/derived-data/sorted_tophat_from_paper/*
do
	output=$(basename $file)
	htseq-count \
	-r pos \
	-o /home/maen5548/genome-analysis-2019/analysis/htseq_count_output/htseq_output_$output \
 	-f bam \
	-t CDS \
	 $file \
	/home/maen5548/genome-analysis-2019/analysis/annotation_from_paper/scaffold-11.gtf > htseq_count_text_$output
done
