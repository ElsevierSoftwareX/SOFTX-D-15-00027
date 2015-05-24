#' Rows correlation to the dimensions chart
#'
#' This function allows you to calculate the correlation of the row categories to the selected dimensions.
#' @param data: ame of the dataset.
#' @param x: dimension for which the row categories correlation is returned.
#' @keywords rows correlation
#' @export
#' @examples
#' data(greenacre_data)
#' rows.corr(greenacre_data, 1) # Returns the correlation of the row categories to the 1 CA dimension.
#' 
rows.corr <- function (data, x){
  cadataframe <- CA(data, graph = FALSE)
  correl.rows <- round(sqrt((cadataframe$row$cos2[,x])), digits=3)
  dotchart2(correl.rows, labels=rownames(data), sort=FALSE,lty=2, xlim=c(0.0, 1.0), xlab=paste("Row categories' correlation with Dim. ",x))
}