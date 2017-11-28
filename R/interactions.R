foo <- women %>%
  setDT %>%
  .[, female := factor(sample(c(T, F), .N, replace = T))]

two_way_interaction_data <- function(training_data, num_factor_length = 5)  {
  gbm_data <- training_data

  features <- names(gbm_data)
  nfeatures <- length(features)
  max_row <- nrow(gbm_data)
  mid_row <- ceiling(max_row / 2)
  cuts <- ceiling(seq(1, max_row, length.out = num_factor_length))


  # Turning each feature into a limited set of values will
  # help constrain the output table size
  feature_factors <- vector("list", length(features))
  feature_centre <- vector("list", length(features))

  for (col in seq_along(features)) {
    if (is.numeric(gbm_data[[col]])) {
      feature_factors[[col]] <- sort(gbm_data[[col]])[cuts]
      feature_centre[[col]] <- median(gbm_data[[col]])
    } else if (is.ordered(gbm_data[[col]])) {
      feature_factors[[col]] <- levels(gbm_data[[col]])
      feature_centre[[col]] <- gbm_data[[col]] %>%
        sort %>%
        .[mid_row] %>%
        as.character
    } else {
      if (!is.factor(gbm_data[[col]])) {
        gbm_data[[col]] <- factor(gbm_data[[col]])
      }
      feature_factors[[col]] <- levels(gbm_data[[col]])
      feature_centre[[col]] <- gbm_data[[col]] %>%
        summary.factor %>%
        sort(decreasing = T) %>%
        .[1] %>%
        names
    }
  }


  # If we
  output <- vector("list", nfeatures)
  combo_rows <- combo_cols <- vector("list", sum(seq(nfeatures - 1)))
  combo_row_iter <- 1


  for (i in seq(nfeatures - 1)) {
    .inner_list <- vector("list", nfeatures - i)
    for (j in seq(nfeatures - i)) {
      feat1 <- feature_factors[[i]]
      feat2 <- feature_factors[[i + j]]
      .inner_list[[j]] <- data.table(a = rep(feat1, times = length(feat2)),
                                     b = rep(feat2, each = length(feat1))) %>%
        setnames(c(features[i], features[i + j]))

      if (combo_row_iter > 1) {
        latest_row <- combo_rows[[combo_row_iter - 1]][length(combo_rows[[combo_row_iter - 1]])]
      } else {
        latest_row <- 0
      }

      combo_rows[[combo_row_iter]] <- latest_row + seq(nrow(.inner_list[[j]]))
      combo_cols[[combo_row_iter]] <- c(i, i + j)

      combo_row_iter <- combo_row_iter + 1
    }
    output[[i]] <- rbindlist(.inner_list, fill = TRUE)
  }


  output <- rbindlist(output, fill = TRUE)
  # mask <- as.data.table(!is.na(output))

  for (col in seq_along(features)) {
    set(output, i = which(is.na(output[[col]])), j = col, value = feature_centre[[col]])
  }

  list(data = output,
       row_index = combo_rows,
       col_index = combo_cols)
}


bah <- two_way_interaction_data(foo, num_factor_length = 5)

i = 3
bah$data[bah$row_index[[i]], bah$col_index[[i]], with = F]
