options(warn=-1)
library("igraph")
data <- scan("stdin")
f <- fit_power_law(data)
cat(f$alpha, f$KS.p, "\n")
