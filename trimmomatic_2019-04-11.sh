

java -jar /sw/apps/bioinfo/trimmomatic/0.36/rackham/trimmomatic-0.36.jar PE -threads 2 \
/home/maen5548/genome-analysis-2019/data/raw-data/transcriptome/untrimmed/SRR6040095_scaffold_11.1.fastq.gz \
/home/maen5548/genome-analysis-2019/data/raw-data/transcriptome/untrimmed/SRR6040095_scaffold_11.2.fastq.gz \
-baseout SRR6040095_scaffold_11.2.fastq.gz LEADING:3 TRAILING:3

/home/maen5548/genome-analysis-2019/data/raw-data/transcriptome/untrimmed
