feature_names <- read.table('features.txt', col.names=c('var_nums', 'var_names'))
activity_labels <- read.table('activity_labels.txt', col.names=c('activity_id', 'activity_name'))

train_data <- read.table('./train/X_train.txt', col.names=feature_names$var_names)
train_subject <- read.table('./train/subject_train.txt', col.names=c('subject'))
train_data$subject = train_subject$subject
train_labels <- read.table('./train/y_train.txt', col.names=c('activity_id'));
train_data$activity = sapply(train_labels$activity_id, function(x) activity_labels$activity_name[x])

test_data <- read.table('./test/X_test.txt', col.names=feature_names$var_names)
test_subject <- read.table('./test/subject_test.txt', col.names=c('subject'))
test_data$subject = test_subject$subject
test_labels <- read.table('./test/y_test.txt', col.names=c('activity_id'));
test_data$activity = sapply(test_labels$activity_id, function(x) activity_labels$activity_name[x])

joined_data <- rbind(train_data, test_data)

mean_std_data <- cbind(joined_data[,grep('*mean\\(\\)|std\\(\\)*', feature_names$var_names)], subject=joined_data$subject, activity=joined_data$activity)

library(dplyr)

subject_activity_averages <- mean_std_data %>%
  group_by(subject, activity) %>%
  summarize_each(funs(mean))

write.table(subject_activity_averages, '2016-09-19 week 4 exercise - step 5.txt', row.names=FALSE)
