#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 9:00:00
#SBATCH -J scaffold-11-trinity-merged
#SBATCH --mail-type=ALL
#SBATCH --mathias.w.engstrom@gmail.com
# Load modules
module load bioinfo-tools
module load trinity

Trinity --genome_guided_bam /home/maen5548/genome-analysis-2019/data/derived-data/top_hat_transcript_alignment_sorted/sorted_merged_tophat_align_2019-05-02.bam --genome_guided_max_intron 10000 --max_memory 20G --CPU 4 --output /home/maen5548/genome-analysis-2019/data/derived-data/trinity_transcriptome_assemblies/trinity_transcriptome_assembly_out_merged_2019-05-02
