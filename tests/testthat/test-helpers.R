test_that("helpers work", {
  m <- metareg_manifest(); expect_true(is.data.frame(m))
  ids <- metareg_datasets(); expect_true(length(ids) >= 1)
  d <- metareg_read(ids[1])
  expect_true(all(c("yi","vi") %in% names(d)))
  expect_true(all(d$vi[is.finite(d$vi)] > 0))
})

test_that("metareg_read rejects bad input", {
  # nonexistent id -> file-not-found stop()
  expect_error(metareg_read("does_not_exist_xyz_00"))
  # non-scalar id -> stopifnot(length(id) == 1)
  expect_error(metareg_read(c("a", "b")))
  # empty id -> stopifnot(nchar(id) > 0)
  expect_error(metareg_read(""))
})

test_that("every dataset exposes yi and vi", {
  ids <- metareg_datasets()
  expect_gt(length(ids), 1)
  for (id in ids) {
    d <- metareg_read(id)
    expect_true(all(c("yi", "vi") %in% names(d)), info = id)
  }
})
