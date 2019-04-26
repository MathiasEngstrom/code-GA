#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J scaffold-11-trinity
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load trinity

for file in /home/maen5548/genome-analysis-2019/data/derived-data/top_hat_transcript_alignment_sorted/*.bam
do
	output=$(basename $file)
	Trinity --genome_guided_bam $file --genome_guided_max_intron 10000 --max_memory 20G --CPU 4 --output /home/maen5548/genome-analysis-2019/data/derived-data/trinity_transcriptome_assemblies/trinity_out_${output%.bam}
done
