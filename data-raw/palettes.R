brain_pals = list(
  tracula = c(
    `Anterior thalamic radiation` = "#d9d933",
    `Corticospinal tract` = "#D296FB",
    `Cingulum (cingulate gyrus)` = "#009A9B",
    `Cingulum (angular bundle)` = "#98CA07",
    `Forceps major` = "#AA7484",
    `Forceps minor` =  "#C96963",
    `Inferior longitudinal fasciculus` = "#949C2E",
    `Superior longitudinal fasciculus` = "#9f9bc7",
    `Uncinate fasciculus` = "#6996FE",
    `Superior longitudinal fasciculus (temporal part)` = "#98FCFF",
    `Cerebral spinal fluid` = "grey20"
  )
)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)

devtools::load_all("../../ggsegExtra/")
tracula_3d <- ggsegExtra:::restruct_old_3datlas(tracula_3d)
tracula_3d <- as_ggseg3d_atlas(tracula_3d)
usethis::use_data(tracula_3d, internal = FALSE, overwrite = TRUE)
