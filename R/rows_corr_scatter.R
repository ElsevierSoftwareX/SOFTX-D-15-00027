#' Scatterplot for row categories correlation with dimensions
#'
#' This function allows to plot a scatterplot of the correlation of row categories with two selected dimensions. A diagonal line (in BLACK) is just a visual aid to eyeball whether a category is actually more correlated (in relative terms) to either of the two dimensions. 
#' @param data: name of the dataset.
#' @param x,y: dimensions for which the correlations are reported.
#' @keywords scatterplot row categories correlation
#' @export
#' @examples
#' data(greenacre_data) #load the sample dataset
#' rows.corr.scatter(greenacre_data,1,2) #plot the scatterplot for dimensions 1&2
#' 
rows.corr.scatter <- function (data, x, y) 
{
  pnt_labls <- rownames(data)
  res <- CA(data, graph=FALSE)
  dfr <- data.frame(dim1=round(sqrt(res$row$cos2[,x]), digits=3), dim2=round(sqrt(res$row$cos2[,y]), digits=3))
  plot(dfr[,1], dfr[,2], pch=19, xlim=c(0,1), ylim=c(0,1), xlab=paste("Row categories' correlation with Dim",x), ylab=paste("Row categories' correlation with Dim",y))
  text(dfr[,1], dfr[,2], labels=pnt_labls, cex= 0.7, pos=3)
  abline(0,1) 
}