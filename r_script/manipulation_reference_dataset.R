library(Matrix)

ref_obj <- readRDS('multiome_sce.rds')

# 2. Estrai la matrice dei conteggi (Geni x Cellule)

# Se è un SingleCellExperiment: 
counts_ref <- assay(ref_obj, "counts")

# 3. Estrai la tabella dei metadati (dove c'è la colonna dei tipi cellulari)
# Se è un SingleCellExperiment: 
metadata_ref <- as.data.frame(colData(ref_obj))

# 4. Salva i metadati in CSV e la matrice in un formato leggero (MTX) per non saturare la RAM
write.csv(metadata_ref, "ref_metadata.csv", row.names = TRUE)
Matrix::writeMM(counts_ref, "ref_counts.mtx")

# Salva anche la lista dei geni e dei barcode delle cellule per ricostruire la matrice in Python
write.table(rownames(counts_ref), "ref_genes.txt", row.names = FALSE, col.names = FALSE)
write.table(colnames(counts_ref), "ref_barcodes.txt", row.names = FALSE, col.names = FALSE)

print("Reference smontato con successo!")



