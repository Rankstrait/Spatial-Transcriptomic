#Tried to launch rctd on R but have a lot of issues of data compatibility from Python to R, for this reason I've run rctd directly 
#on Python

library(zellkonverter)
library(SingleCellExperiment)
library(spacexr)
library(Matrix)

sce_fibers <- readH5AD("fibers_visium_hd.h5ad")

# 2. Estrai la matrice dei conteggi (Fibre x Geni)
# Nota: RCTD vuole i geni sulle righe e i pixel/fibre sulle colonne, quindi trasponiamo
counts_fibers <- t(assay(sce_fibers, "X"))


# 2. Le coordinate x e y sono dentro lo slot colData, anche se colnames(colData) era vuoto,
# R le ha mappate come attributi diretti dell'oggetto. Estraile così:
x_coords <- as.numeric(sce_fibers$x)
y_coords <- as.numeric(sce_fibers$y)

# 3. Costruisci il dataframe delle coordinate mantenendo lo STESSO IDENTICO ORDINE
coords_fibers <- data.frame(
  x = x_coords,
  y = y_coords, # usa i nomi delle colonne dei conteggi come indice
  row.names = colnames(sce_fibers)
)

#cre oggetto spatialRNA per RCTD
spatial_rna <- SpatialRNA(coords = coords_fibers, counts = counts_fibers)
