context("test-Printsummary-alphapart")

test_that("Test Printsummary.AlphaPart", {

  ## Small pedigree with additive genetic (=breeding) values
  ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                     fid=c(  0,   0,   2,   0,   4,   0),
                     mid=c(  0,   0,   1,   0,   3,   0),
                     loc=c("A", "A", "C", "B", "C", "C"),
                    trt1=c(100, 120, 115, 130, 125, 125),
                    trt2=c(100, 110, 105, 100,  85, 110),
                     gen=c(  1,   1,   2,   2,   3,   3))

  ## Partition additive genetic values
  tmp <- AlphaPart(x=ped, colBV=c("trt1", "trt2"), center = FALSE)
  x <- summary(tmp, by="gen")

  ## Test summary for trt1
  expect_equal(print(x$trt1$N),   c(2, 2, 2))
  expect_equal(print(x$trt1$Sum), c(110, 122.5, 125.0))
  expect_equal(print(x$trt1$A),   c(110,  55,    27.5))
  expect_equal(print(x$trt1$B),   c(  0,  65,    32.5))
  expect_equal(print(x$trt1$C),   c(  0,   2.5,  65.0))


  ## Test summary for trt2
  expect_equal(print(x$trt2$N),   c(2, 2, 2))
  expect_equal(print(x$trt2$Sum), c(105, 102.50, 97.50))
  expect_equal(print(x$trt2$A),   c(105,  52.50, 26.25))
  expect_equal(print(x$trt2$B),   c(  0,  50.00, 25.00))
  expect_equal(print(x$trt2$C),   c(  0,   0.00, 46.25))


  ## Test FUN argument
  x <- summary(tmp, by="gen", FUN=max)
  expect_equal(print(x$trt1$N),   c(2, 2, 2))
  expect_equal(print(x$trt1$Sum), c(120, 130, 125))
  expect_equal(print(x$trt1$A),   c(120, 110,  55))
  expect_equal(print(x$trt1$B),   c(  0, 130,  65))
  expect_equal(print(x$trt1$C),   c(  0,   5, 125))

  ## Test labelSum argument
  x <- summary(tmp, by="gen", labelSum="bla")
  expect_true("bla" %in% colnames(x$trt1))

  ## Test subset argument
  x <- summary(tmp, by="gen", subset=tmp[[1]]$gen != 3)
  expect_equal(print(x$trt1$N),   c(2, 2))
  expect_equal(print(x$trt1$Sum), c(110, 122.5))
  expect_equal(print(x$trt1$A),   c(110,  55))
  expect_equal(print(x$trt1$B),   c(  0,  65))
  expect_equal(print(x$trt1$C),   c(  0,   2.5))
})
