#In this code I extract in formations of the reference dataset packed in .rds object, I am doing that because i want to use
#the data inside that object to run rctd analysis on Python

library(Matrix)

#read the reference.rds object
ref_obj <- readRDS('multiome_sce.rds')

#Extract the counts matrix (geni x cells)
counts_ref <- assay(ref_obj, "counts")

#Extract metadata 
metadata_ref <- as.data.frame(colData(ref_obj))

#save metada in a csv file and counts in a mtx file in order to avoid RAM saturation
write.csv(metadata_ref, "ref_metadata.csv", row.names = TRUE)
Matrix::writeMM(counts_ref, "ref_counts.mtx")

#Save list of genes and cells barcode to reconstruct the matrix in Python
write.table(rownames(counts_ref), "ref_genes.txt", row.names = FALSE, col.names = FALSE)
write.table(colnames(counts_ref), "ref_barcodes.txt", row.names = FALSE, col.names = FALSE)





