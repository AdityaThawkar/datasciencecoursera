---
title: "README"
author: "Aditya Thawkar"
date: "16 October 2020"
output: word_document
---

Description of steps undertaken to clean and reshape the data:

1. Read the files containing the labels for activities and features of vector

2. Read the test data

Read the data identifying subjects for test observations and rename columns .
Read the data containing the feture list for test observations and add descriptions .
Read the data identifying type of activity for test observations and rename columns .
Column bind files under first 3 steps to get the complete table for test observations .
Keep only necessary columns, Subject.Id, Activity and columns containing mean in their description .
Add the description for activity type to produce the final test data for observations

3. Read the training data

Reproduce steps taken in step 2 for training data to get the final training data for observations

4. Merge Training and Test data to create one data set (training and test data have the same format, they will be bound vertically)

5. Reshape the merged data to produce the desired format for data aggregation

Use the melt function to prepare data for dcast aggregation .
Aggregate data with dcast function to produce the final (tidy) data set

6.Finally write out to csv file the tidy data set in the Data folder.
