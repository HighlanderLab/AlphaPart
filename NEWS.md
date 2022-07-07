# AlphaPart 0.9.5

* Removed dependency: ```gdata```
* Added dependency: ```methods```
* Fixed bugs:
    * tibble data is converted into data.frame to avoid 

# AlphaPart 0.9.4

* Internal function to transform tibble data into a data frame (stop crashing)
* Covariance is only returned when the levels of ```colPath``` is higher than 1. 


# AlphaPart 0.9.1

* Improving performance - memory usage and execution time.
  * Execution time was improved in approximately 25%
  * Memory usage was improved in approximately 5%

# AlphaPart 0.9.0

* AlphaPart now  has a method for partitioning trends in genetic mean and variance to understand breeding practices
* New dependencies: dplyr, magrittr
* Arguments:
    * center: detect a shift in base population mean and attributes it as parent average effect rather than Mendelian sampling effect
    * scaleEBV: you can define whether is appropriate to center and/or scale the colBV columns in respect to the base population

---

# AlphaPart 0.8.2

* The AlphaPart now has an associated paper at the Genetics Selection Evolution that you can use to cite the AlphaPart if you use it in a paper.
    * DOI: [https://doi.org/10.1186/s12711-021-00600-x](https://doi.org/10.1186/s12711-021-00600-x)
