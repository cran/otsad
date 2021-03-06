## Generate data
set.seed(100)
n <- 180
x <- sample(1:100, n, replace = TRUE)
x[70:90] <- sample(110:115, 21, replace = TRUE)
x[25] <- 200
x[150] <- 170
df <- data.frame(timestamp = 1:n, value = x)

# Add is.real.anomaly column
df$is.real.anomaly <- 0
df[c(25,80,150), "is.real.anomaly"] <- 1

## Calculate anomalies
result <- CpSdEwma(
  data = df$value,
  n.train = 5,
  threshold = 0.01,
  l = 3
)
res <- cbind(df, result)

# Get Window Limits
data <- GetWindowsLimits(res)
data[data$is.real.anomaly == 1,]

# Get labels
data <- GetLabels(data)
data[data$is.real.anomaly == 1 | data$is.anomaly == 1,]

# Plot results
PlotDetections(res, print.real.anomaly = TRUE, print.time.window = TRUE)
