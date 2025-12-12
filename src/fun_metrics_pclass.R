# define funtion to get per-class metrics

# input: dataframe with the truth label ("subype_rudin_label") and predicted label (".pred_class") as columns
# output: dataframe with metrics of interest by class

metrics_pclass = function(data) {
  
  # define metrics of interest
  metrics = yardstick::metric_set(yardstick::accuracy, 
                                  yardstick::bal_accuracy,
                                  yardstick::sens, 
                                  yardstick::spec, 
                                  yardstick::precision,
                                  yardstick::recall,
                                  yardstick::f_meas,
                                  yardstick::npv,
                                  yardstick::ppv)
  
  possible_classes = unique(data$subype_rudin_label)
  metrics_results = purrr::map(possible_classes, function(class) {
    # Create a binary classification scenario for the current class
    df_binary = data %>%
      mutate(
        binary_truth = factor(ifelse(subype_rudin_label == class, "X", "Z")), # X for the positive class, Z for the negative class
        binary_predicted = factor(ifelse(.pred_class == class, "X", "Z")) # X for the positive class, Z for the negative class
      )
    
    # Check if both levels are present in binary_predicted
    if (length(levels(df_binary$binary_predicted)) < 2) {
      return(NA)
    }
    
    # Calculate metrics
    class_metrics = df_binary %>%
      metrics(truth = binary_truth, estimate = binary_predicted) %>%
      dplyr::mutate(class = class)  # Add the class name
    
    return(class_metrics)
  })
}
