# Solving the protein weight calculator task in R

### Introduction
The objective of this task was to develop a robust, efficient R function capable of calculating the total molecular weight of a protein sequence in kilodaltons (kDa), while handling non-protein characters. I had to ensure computational efficiency and input normalisation. 



### Data Mapping
My first foundational step involved mapping the 20 standard amino acids (1-Letter code) to their respective molecular weights (Da). I explicitly avoided the usage of dataframes or series of conditional statements and instead utilised a named numeric vector. In R, this structure allows for O(1) lookup time as the amino acid’s one-letter code serves as the key to unlock its weight. 

### Input normalisation
I  had to ensure the function remained robust to varied user inputs (such as uppercase/lowercase names). The input string was passed through toupper() to convert it to uppercase. I then split the sequence into individual amino acid residues using strsplit(), which transformed a single string into a character vector, preparing it for vectorised operations. 


### Vectorised Mapping
I passed the character vector into the weights vector as an index, allowing R to perform the high-speed match. This approach is more computationally efficient in comparison to iterative loops, especially when dealing with high-throughput genomic data. 

### Edge Case/ Error Handling
Invalid protein characters (like ‘B’) naturally return NA in the named lookup. Therefore, I utilised logical subsetting with is.na() to identify these entries and replace their weight with 0, ensuring the function remains stable and avoids logic errors. 


### Final Transformation

Lastly, the individual masses were summed together using sum() and then divided by 1000 to convert the final output from Daltons to KiloDaltons. 
