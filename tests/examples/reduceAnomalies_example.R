## Generate data
set.seed(100)
n <- 180
x <- sample(1:100, n, replace = TRUE)
x[70:90] <- sample(110:115, 21, replace = TRUE)
x[25] <- 200
x[150] <- 170
df <- data.frame(timestamp = 1:n, value = x)

## Calculate anomalies
result <- CpSdEwma(
  data = df$value,
  n.train = 5,
  threshold = 0.01,
  l = 2
)
res <- cbind(df, result)

## Plot results
PlotDetections(res, title = "KNN-CAD ANOMALY DETECTOR")

## Reduce anomalies
res$is.anomaly <- ReduceAnomalies(res$is.anomaly, windowLength = 5)

## Plot results
PlotDetections(res, title = "KNN-CAD ANOMALY DETECTOR")