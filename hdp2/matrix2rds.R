# Get command line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if the correct number of arguments is provided
if (length(args) != 1) {
  stop("Usage: Rscript matrix2rds.R <input_file.tsv>")
}

# Read the TSV file from the command line argument
input_file <- args[1]
df <- read.table(input_file, header = TRUE, sep = "\t", check.names = FALSE)

# Transpose the data frame
df_transposed <- as.data.frame(t(df))

# Set the first row as the column names
colnames(df_transposed) <- df_transposed[1, ]
df_transposed <- df_transposed[-1, ]

# Save the transposed data frame as an RDS file
saveRDS(df_transposed, "matrix_96_data.rds")

# Extract the row names of the transposed data frame
sample_names <- rownames(df_transposed)

# Save the sample names as an RDS file
saveRDS(sample_names, "sample_names.rds")