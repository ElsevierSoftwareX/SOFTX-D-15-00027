#' Scatterplot for column categories correlation with dimensions
#'
#' This function allows to plot a scatterplot of the correlation of column categories with two selected dimensions. A diagonal line (in BLACK) is just a visual aid to eyeball whether a category is actually more correlated (in relative terms) to either of the two dimensions. 
#' @param data: Name of the dataset.
#' @param x,y: dimensions for which the correlations are reported.
#' @keywords scatterplot column categories correlation
#' @export
#' @examples
#' data(greenacre_data) #load the sample dataset
#' cols.corr.scatter(greenacre_data,1,2) #plot the scatterplot for dimensions 1&2
#' 
cols.corr.scatter <- function (data, x, y) 
{
  pnt_labls <- colnames(data)
  res <- CA(data, graph=FALSE)
  dfr <- data.frame(dim1=round(sqrt(res$col$cos2[,x]), digits=3), dim2=round(sqrt(res$col$cos2[,y]), digits=3))
  plot(dfr[,1], dfr[,2], pch=19, xlim=c(0,1), ylim=c(0,1), xlab=paste("Cols categories' correlation with Dim",x), ylab=paste("Cols categories' correlation with Dim",y))
  text(dfr[,1], dfr[,2], labels=pnt_labls, cex= 0.7, pos=3)
  abline(0,1) 
}