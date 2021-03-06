#' Chart of rows quality of the display
#'
#' This function allows you to calculate the quality of the display of the row categories on pairs of selected dimensions.
#' @param data: name of the dataset.
#' @param x,y: dimensions for which the correlations are returned.
#' @keywords rows quality
#' @export
#' @examples
#' data(greenacre_data)
#' rows.qlt(greenacre_data,1,2) #Returns the quality of the display of the row categories on the 1&2 dimensions
#' 
rows.qlt <- function (data,x,y){
  cadataframe <- CA(data, graph=FALSE)
  quality.rows <- (cadataframe$row$cos2[,x]*100+cadataframe$row$cos2[,y]*100)
  dotchart2(quality.rows, labels=rownames(data), sort=FALSE,lty=2, xlim=c(0, 100), xlab=paste("Row categories' quality of the display (% of inertia) on Dim.", x, "+", y))
  }