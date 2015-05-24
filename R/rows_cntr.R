#' Rows contribution chart
#'
#' This function allows to calculate the contribution of the row categories to the selected dimension. 
#' The function returns a dot plot in which a reference line indicates the threshold for a significant (i.e., important for the sake of dimension interpretation) contribution.
#' By selecting one of the function's parameters as true (i.e., cti=T), the plot will also show the contributions to the total inertia, which is represented by hollow circles. This option allows to compare the contribution of each category to the inertia of the dimension in the overall framework of its contribution to the overall inertia of the input contingency table.
#' @param data: name of the dataset.
#' @param x: dimension for which the row categories contribution is returned.
#' @param cti:logical value which specifies if the contribution to the total inertia must be displayed as well. No missing value is allowed. Use T for 'true', F for 'false'.
#' @keywords rows contribution
#' @export
#' @examples
#' data(greenacre_data)
#' rows.cntr(greenacre_data, 2, T) # Returns the contribution of the row categories to the first 2 CA dimensions, and also displays the contribnution to the total inertia.
#' 
rows.cntr <- function (data, x, cti) 
{
  nrows <- nrow(data)
  cadataframe <- CA(data, graph=FALSE)
  dotchart2(cadataframe$row$contrib[, x]*10, labels = rownames(data),sort = FALSE, lty = 2, xlim = c(0, 1000), xlab = paste("Row categories' contribution to Dim. ",x, " (in permills)"))
  abline(v = round(((100/nrows) * 10), digits = 0), lty = 2, col = "RED")
    if (cti == T) {
      res.ca <- summary(ca(data))
      dotchart2(res.ca$rows[, 4], pch = 1, xlim = c(0, 1000), add = TRUE)
      title(sub = "note: solid circle=contrib. to the dimension; hollow circle=contrib. to the total inertia", 
            cex.sub = 0.75)
    }
  }