#' Scatterplot for column categories contribution to dimensions
#'
#' This function allows to plot a scatterplot of the contribution of column categories to two selected dimensions. Two references lines (in RED) indicate the threshold above which the contribution can be considered important for the determination of the dimensions. A diagonal line (in BLACK) is just a visual aid to eyeball whether a category is actually contributing more (in relative terms) to either of the two dimensions. 
#' @param data: name of the dataset.
#' @param x,y: dimensions for which the contributions are reported.
#' @keywords scatterplot column categories contribution
#' @export
#' @examples
#' data(greenacre_data) #load the sample dataset
#' cols.cntr.scatter(greenacre_data,1,2) #plot the scatterplot for dimensions 1&2
#' 
cols.cntr.scatter <- function (data, x, y) 
{
  ncols <- ncol(data)
  pnt_labls <- colnames(data)
  res <- CA(data, graph=FALSE)
  dfr <- data.frame(dim1=res$col$contrib[,x]*10, dim2=res$col$contrib[,y]*10)
  xmax <- max(dfr[,1])+10
  ymax <- max(dfr[,2])+10
  limit <- max(xmax,ymax)
  plot(dfr[,1], dfr[,2], pch=19, xlim=c(0,limit), ylim=c(0,limit), xlab=paste("Cols categories' contribution (in permills) to Dim",x), ylab=paste("Cols categories' contribution (in permills) to Dim",y))
  text(dfr[,1], dfr[,2], labels=pnt_labls, cex= 0.7, pos=3)
  abline(0,1) 
  abline(v = round(((100/ncols) * 10), digits = 0), lty = 2, col = "RED")
  abline(h = round(((100/ncols) * 10), digits = 0), lty = 2, col = "RED")
}