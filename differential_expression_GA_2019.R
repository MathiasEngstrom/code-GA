library( "DESeq2" )

# Read tsv formatted coun tables from htseq-count

SRR_92_leaf <- read.table(file = 'C:/Users/Mathias/htseq_count_GA2019/htseq_count_text_accepted_hits_sorted_tophat_out_SRR6040092_scaffold_11.1.bam', sep = '\t', header = FALSE)
SRR_93_root <- read.table(file = 'C:/Users/Mathias/htseq_count_GA2019/htseq_count_text_accepted_hits_sorted_tophat_out_SRR6040093_scaffold_11.1.bam', sep = '\t', header = FALSE)
SRR_95_aril <- read.table(file = 'C:/Users/Mathias/htseq_count_GA2019/htseq_count_text_accepted_hits_sorted_tophat_out_SRR6040095_scaffold_11.1.bam', sep = '\t', header = FALSE)
SRR_96_stem <- read.table(file = 'C:/Users/Mathias/htseq_count_GA2019/htseq_count_text_accepted_hits_sorted_tophat_out_SRR6040096_scaffold_11.1.bam', sep = '\t', header = FALSE)

# Merge into a single dataframe based on gene names in column v1

read_counts <- merge(SRR_95_aril, SRR_92_leaf, by = 'V1')                         
read_counts <- merge(read_counts, SRR_93_root, by = 'V1')
read_counts <- merge(read_counts, SRR_96_stem, by = 'V1')

# Remove top 5 rows which are not genes
read_counts <- read_counts[-seq(1, 5), ]

# Save gene names
row_names <- read_counts[ , 1]

# Remove gene names as column
read_counts <- read_counts[ , -1]

# Set gene names as column names
rownames(read_counts) <- row_names

# Add column headers
column_headers <- c('SRR6040095', 'SRR6040092', 'SRR6040093', 'SRR6040096')
names(read_counts) <- (column_headers)

# Create the meta data dataframe describing the columns in the actul data dataframe.
# We compare types aril and non-aril(fruit, non-fruit).
type <- c('aril', 'non_aril', 'non_aril', 'non_aril')
column_data <- cbind.data.frame(column_headers, type)

# Create DEseq2 data object
dds <- DESeqDataSetFromMatrix(
  countData = read_counts,
  colData = column_data,
  design = ~ type)

# Perform the analysis
deseq2_result <- DESeq(dds)

# Results overview
res_1 <- results( deseq2_result )

# Transform the data and calculate euclidean distances for the expression
rld <- rlog( dds )
sampleDists <- dist( t( assay(rld) ) )

# Plot top 35 variably expressed genes in a heatmap
library( "gplots" )
library( "RColorBrewer" )
library( "genefilter" )

topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 35 )
heatmap.2( assay(rld)[ topVarGenes, ], scale="row",
           trace="none", dendrogram="column",
           col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255), margins=c(1,8), par(oma=c(10,4,4,2)), cexCol=1)






                          