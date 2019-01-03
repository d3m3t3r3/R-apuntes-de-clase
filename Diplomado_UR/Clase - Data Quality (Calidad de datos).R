@@ -0,0 +1,69 @@
  # 1
  library(dlookr)
library(nycflights13)
dim(flights)
flights

# 2
diagnose(flights)

# 3
diagnose(flights, year, month, day)
diagnose(flights, year:day)
diagnose(flights, -(year:day))

# 4
flights %>%
  diagnose() %>%
  select(-unique_count, -unique_rate) %>% 
  filter(missing_count > 0) %>% 
  arrange(desc(missing_count))

# 5
diagnose_numeric(flights)

# 6
diagnose_numeric(flights) %>% 
  filter(minus > 0 | zero > 0)

# 7
diagnose_category(flights)

diagnose_category(flights) %>% 
  filter(is.na(levels))

flights %>%
  diagnose_category(top = 500)  %>%
  filter(ratio <= 0.01)

# 8
diagnose_outlier(flights)

diagnose_outlier(flights) %>% 
  filter(outliers_cnt > 0) 

diagnose_outlier(flights) %>% 
  filter(outliers_ratio > 5) %>% 
  mutate(rate = outliers_mean / with_mean) %>% 
  arrange(desc(rate)) %>% 
  select(-outliers_cnt)

# 9
flights %>%
  plot_outlier(arr_delay) 

flights %>%
  plot_outlier(diagnose_outlier(flights) %>% 
                 filter(outliers_ratio >= 0.5) %>% 
                 select(variables) %>% 
                 unlist())

# 10
flights %>%
  diagnose_report()

flights %>%
  diagnose_report(output_format = "html")

flights %>%
  diagnose_report(output_format = "html", output_file = "Diagn.html")