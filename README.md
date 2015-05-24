# CAinterprTools
vers 0.4

A number of interesting packages are available to perform Correspondence Analysis in R. At the best of my knowledge, however, they lack some tools to help users to eyeball some critical CA aspects (e.g., contribution of rows/cols categories to the principal axes, quality of the display,correlation of rows/cols categories with dimensions, etc). Besides providing those facilities, this package allows calculating the significance of the CA dimensions by means of the 'Average Rule', the Malinvaud test, and by permutation test. Further, it allows to also calculate the permuted significance of the CA total inertia. 

The package comes with a dataset (greenacre_data) after Greenacre 2007 (p. 90, exhibit 12.1).


## List of implemented functions
to load the sample dataset:
```r
data("greenacre_data")
```

to display a bar plot of the strength of the correlation between rows and columns of the input contingency table:
```r
ca.corr(greenacre_data)
```

to calculate the significance of the CA total inertia via permutation test; a density curve of the permuted total inertia is displayed along with the observed total inertia and the 95th percentile of the permuted total inertia. The latter can be regarded as a 0.05 alpha threshold for the observed total inertia's significance:
```r
sig.tot.inertia.perm(greenacre_data)
```

to return a chart suggesting which CA dimension is important for data structure interpretation, according to the so-called 'average rule':
```r
aver.rule(greenacre_data)
```

to perform the Malinvaud test and to print on screen the test's result (among which the significance of the CA dimensions); a plot is also provided, wherein a reference line (in RED) indicates the 0.05 threshold:
```r
malinvaud(greenacre_data)
```

to calculate the significance of the 1 and 2 CA dimensions via permutation test, and to display the results as a scatterplot; reference lines provide information about the significance of the selected dimensions:
```r
sig.dim.perm(greenacre_data,1,2)
```

to display the contribution of the row categories to the 1 CA dimension; a reference line  indicates the threshold above which a contribution can be considered important for the determination of the dimension. The parameter 'T' specifies that the categories' contribution to the total inertia is also shown (hollow circle):
```r
rows.cntr(greenacre_data,1,T)
```

to display a scatterplot for the row categories contribution to dimension 1&2:
```r
rows.cntr.scatter(greenacre_data,1,2)
```

to chart the quality of row categories display on the sub-space determined by, say, the 1&2 CA dimensions:
```r
rows.qlt(greenacre_data,1,2)
```

to display the correlation of the row categories with the 1 CA dimension:
```r
rows.corr(greenacre_data,1) 
```

to display a scatterplot for row categories correlation with dimension 1&2:
```r
rows.corr.scatter(greenacre_data,1,2)
```

The column equivalent of the last five functions:
```r
cols.cntr(greenacre_data,1,T)
cols.cntr.scatter(greenacre_data,1,2)
cols.qlt(greenacre_data,3) 
cols.corr(greenacre_data,1) 
cols.corr.scatter(greenacre_data,1,2)
```


## Installation
To install the package  in R, just follow the few steps listed below:

1) install the 'devtools' package:  
```r
install.packages("devtools", dependencies=TRUE)
```
2) load that package: 
```r
library(devtools)
```
3) download the 'CAinterprTools' package  from GitHub via the 'devtools''s command: 
```r
install_github("gianmarcoalberti/CAinterprTools")
```
4) load the package: 
```r
library(CAinterprTools)
```
5) enjoy!


## Companion website
[Correspondence Analysis in Archaeology](http://cainarchaeology.weebly.com)
