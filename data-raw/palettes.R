devtools::load_all("../../ggsegExtra/")
devtools::load_all(".")

# Make palette
brain_pals <- make_palette_ggseg(tracula_3d)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")

# fix atlas
tracula_n <- tracula
tracula_n <- unnest(tracula_n, ggseg)
tracula_n <- group_by(tracula_n, label, hemi,  side, region, .id)
tracula_n <- nest(tracula_n)
tracula_n <- group_by(tracula_n, hemi,  side, region)
tracula_n <- mutate(tracula_n, .subid = row_number())
tracula_n <- unnest(tracula_n, data)
tracula_n <- ungroup(tracula_n)
tracula_n <- mutate(tracula_n,
                region = as.character(region),
                region = gsub("angular bundle", "hippocampus", region),
                region = ifelse(grepl("fluid", region), NA, region))
tracula_n <- as_ggseg_atlas(tracula_n)

tracula_n %>%
  ggseg(atlas = ., show.legend = TRUE,
        colour = "black",
        mapping = aes(fill=region)) +
  scale_fill_brain("tracula", package = "ggsegTracula", na.value = "black")


tracula <- tracula_n
usethis::use_data(tracula,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")
