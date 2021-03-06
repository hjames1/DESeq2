context("fpkm")
test_that("fpkm works as expected", {
  dds <- DESeqDataSetFromMatrix(matrix(c(1:4,2 * 1:4), ncol=2), DataFrame(x=1:2), ~ 1)
  rowRanges(dds) <- GRanges("1", IRanges(start=0:3 * 10 + 1, width=10))
  expect_equal(fpkm(dds)[1,1], 1e5 * 100, tolerance=.1) 
  expect_equal(fpm(dds)[1,1], 1e5, tolerance=.1)
  expect_equal(fpm(dds, robust=FALSE)[1,1], 1e5)
})
