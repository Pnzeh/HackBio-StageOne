MW_calculator <- function(sequence = "YOURNAME"){
  
  weights <- c(
    A = 89.09,  R = 174.20, N = 132.12, D = 133.10, C = 121.15,
    E = 147.13, Q = 146.15, G = 75.07,  H = 155.16, I = 131.18,
    L = 131.18, K = 146.19, M = 149.21, F = 165.19, P = 115.13,
    S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15
  )
  
  split = strsplit(toupper(sequence), "")[[1]]
  matched_weight <- weights[split] 
  
  
  matched_weight[is.na(matched_weight)] <- 0
  
  kDa <- sum(matched_weight) / 1000
  
  return(kDa)
}


result <- MW_calculator()

cat("The molecular weight is:",result, "kDa")
