context("test-adapt_scales")
test_that("Check that ggseg:::adapt_scales is working", {
  expect_equal(mode(ggseg:::adapt_scales(unnest(tracula, ggseg))), "list")
})

context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("tracula", package = "ggsegTracula")), 11)

  expect_error(brain_pal("tracula"), "not a valid")

  expect_true(all(names(brain_pal("tracula", package = "ggsegTracula")) %in% tracula$region))
})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = tracula),c("gg","ggplot"))

  expect_is(ggseg(atlas = tracula, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = tracula, mapping = aes(fill = region)) +
              scale_fill_brain("tracula", package = "ggsegTracula"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = tracula, mapping = aes(fill = region)) +
              scale_fill_brain("tracula", package = "ggsegTracula"),
            c("gg","ggplot"))

  expect_warning(ggseg(atlas = tracula, mapping=aes(fill=area),
                  position="stacked"), "Cannot stack")

  expect_is(ggseg(atlas = tracula, mapping=aes(fill=area), adapt_scales = F ),c("gg","ggplot"))

})


context("test-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=tracula_3d),
    c("plotly", "htmlwidget")
  )
})


context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_ggseg_atlas(tracula))

})

context("test-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(tracula_3d))

})
