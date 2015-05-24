#' Columns correlation to the dimensions chart
#'
#' This function allows you to calculate the correlation of the column categories to the selected dimensions.
#' @param data: name of the dataset.
#' @param x: dimension for which the column categories correlation is returned.
#' @keywords cols correlation
#' @export
#' @examples
#' data(greenacre_data)
#' cols.corr(greenacre_data, 1) #Returns the correlation of the column categories to the 1 CA dimension.
#' 
cols.corr <- function (data, x) 
{
  cadataframe <- CA(data, graph = FALSE)
  correl.cols <- round(sqrt(cadataframe$col$cos2[, x]),digits = 3)
  dotchart2(correl.cols, labels = colnames(data), sort = FALSE, lty = 2, xlim = c(0, 1), xlab = paste("Column categories' correlation with Dim. ",x))
}