#' Chart of columns quality of the display
#'
#' This function allows you to calculate the quality of the display of the column categories on pairs of selected dimensions.
#' @param data: name of the dataset.
#' @param x, y: dimensions for which the correlations are returned.
#' @keywords cols quality
#' @export
#' @examples
#' data(greenacre_data)
#' cols.qlt(greenacre_data, 1,2) #Returns the quality of the display of the column categories on the 1&2 dimensions.
#' 
cols.qlt <- function (data,x,y){
  cadataframe <- CA(data, graph=FALSE)
  quality.cols <- (cadataframe$col$cos2[,x]*100+cadataframe$col$cos2[,y]*100)
  dotchart2(quality.cols, labels=colnames(data), sort=FALSE,lty=2, xlim=c(0, 100), xlab=paste("Column categories' quality of the display (% of inertia) on Dim.", x, "+",y))
}