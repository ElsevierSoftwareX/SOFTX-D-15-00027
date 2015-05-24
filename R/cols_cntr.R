#' Columns contribution chart
#'
#' This function allows you to calculate the contribution of the column categories to the selected dimensions. 
#' The function returns a dot plot in which a reference line indicates the threshold for a significant (i.e., important for the sake of dimension interpretation) contribution.
#' By selecting one of the function's parameters as true (i.e., cti=T), the plot will also show the contributions to the total inertia, which is represented by hollow circles. This option allows to compare the contribution of each category to the inertia of the dimension in the overall framework of its contribution to the overall inertia of the input contingency table.
#' @param data: name of the dataset.
#' @param x: dimension for which the column categories contribution is returned.
#' @param cti: logical value which specifies if the contribution to the total inertia must be displayed as well. No missing value is allowed. Use T for 'true', F for 'false'.
#' @keywords columns contribution
#' @export
#' @examples
#' data(greenacre_data)
#' cols.cntr(greenacre_data, 2, T) # Returns the contribution of the row categories to first 2 CA dimensions, and also displays the contribution to the total inertia.
#'  
cols.cntr <- function (data, x, cti) 
{
  ncols <- ncol(data)
  cadataframe <- CA(data, graph=FALSE)
  dotchart2(cadataframe$col$contrib[, x]*10, labels = colnames(data),sort = FALSE, lty = 2, xlim = c(0, 1000), xlab = paste("Column categories' contribution to Dim. ",x, " (in permills)"))
  abline(v = round(((100/ncols) * 10), digits = 0), lty = 2,col = "RED")
  if (cti == T) {
    res.ca <- summary(ca(data))
    dotchart2(res.ca$columns[, 4], pch = 1, xlim = c(0,1000), add = TRUE)
    title(sub = "note: solid circle=contrib. to the dimension; hollow circle=contrib. to the total inertia", 
          cex.sub = 0.75)
  }
}