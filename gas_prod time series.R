library(forecast)
#loading the gas_prod dataset
data<-read.csv('gas_prod.csv')
#inspecting the data
data
# the data has 2 columns and 240 rows of data
#creating a timeseries object
data_df<-ts(data[,2])
head(data_df)
#plotting a timeseries of the data
plot(data_df,xlab='Time in (months)',ylab='Gasoline production(Millions of barrels)')
#a plot of differenced data_df to make it stationary
plot(diff(data_df))
abline(a=0,b=0)
#examinnig the acf and pacf of the differenced time series
acf(diff(data_df),xaxp=c(0,48,4),lag.max = 48,main='')
pacf(diff(data_df),xaxp=c(0,48,4),lag.max = 48,main='')
#plotting the arima model
arima_1<-arima(data_df,order=c(0,1,0),seasonal = list(order=c(1,0,0),period=12))
arima_1
#from the above, the value of seasonal coefficient of AR(1) is 0.8335 and the standard error is 0.0324
#plotting the residuals of the model
acf(arima_1$residuals,xaxp=c(0,48,4),lag.max=48,main='')
pacf(arima_1$residuals,xaxp=c(0,48,4),lag.max = 48,main='')
