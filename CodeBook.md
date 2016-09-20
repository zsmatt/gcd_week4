Variables:
feature_names - contains feature names from features.txt for use as column headers
activity_labels - contains translation from numeric activity IDs to readable activity labels from activity_labels.txt
train_data - ultimately contains consolidated training data. All features as defined in features_info.txt and named in features.txt with standard R replacement for characters invalid in column names.  'subject' is added with the subject ID and 'activity' with the activity label (e.g. SITTING).
train_subject & train_labels - temporary variables used to load the separate subject and activity label data
test_data, test_subject, & test_labels - equivalent to train_ data frames but with test partition of data
joined_data - combined data from the training and test partitions with the same layout as train_data
mean_std_data - dataset which includes only the mean and std variables plus subject and activity labels
subject_activity_averages - averages of mean and std variables at the subject, activity level


Data:
Training and test data from given zip.

Processing:
Feature data, label data, and subject data is loaded as 3 separate data sets for each of training and test data partitions.  Both partitions (train and test) are cleaned up by naming the features, converting the activity IDs to labels, and merging the data sets.  The two partitions are then combined in joined_data.

In the last two steps, mean and standard deviations are pulled out and then averages computed at the subject, activity level as per the exercise.