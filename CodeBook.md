# CodeBook

## Description

This dataset is a tidy version of the UCI
Human Activity Recognition Using Smartphones Dataset.
It includes the average of each selected measurement
(mean and standard deviation) for each activity and each subject.
The data were collected from the accelerometers and gyroscopes of
a Samsung Galaxy S smartphone carried by 30 volunteers while 
performing six different activities.

## Source

Original source: [UCI Machine Learning Repository]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables

### Identifiers
- **person ID**: A unique ID for each volunteer (1–30)
- **Activity**: One of six activities performed during data collection:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

### Feature Measurements
Each measurement represents the mean of a
specific sensor signal for each subject/activity pair.
The following is a description of the variable naming convention:

- **Domain**: Time domain (`t`) or frequency domain (`f`)

- **Signal**: Body or Gravity acceleration
or jerk or gyroscope (e.g., `BodyAcc`, `GravityAcc`, `BodyGyro`)

- **Statistic**: Mean (`mean()`) or standard deviation (`std()`)

- **Axis**: X, Y, or Z (e.g., `-X`, `-Y`, `-Z`) if applicable

**Example Variables**:
- `tBodyAcc-mean()-X`: Mean of time-domain body acceleration in X direction

- `tBodyGyro-std()-Z`: Standard deviation of time-domain body gyroscope in Z direction

Note: Only measurements related to `mean()`
and `std()` were included, as required by the project.

## Data Cleaning and Processing Steps

1. **Downloaded and unzipped the dataset** from the provided link.

2. **Loaded** the training and test sets
(`X`, `y`, `subject`) for features, activity labels, and subject IDs.

3. **Merged** the training and test
datasets into one dataset using `rbind()`.

4. **Extracted** only measurements on the
mean and standard deviation using `grep("mean\()|std\()", features)`.

5. **Assigned descriptive variable names**
to the dataset using the `features.txt` file.

6. **Replaced activity IDs with descriptive names**
by merging with
`activity_labels.txt`.

7. **Grouped** the data by subject
and activity using `group_by()`.

8. **Created the final tidy dataset** by
computing the mean of each variable for
each activity and each subject.

9. **Exported** the tidy dataset as
`tidy_data.txt` (or `.csv`) for submission
and sharing.

## Output File

The final tidy dataset includes **180
rows** (30 subjects × 6 activities) and
**88 columns** (2 identifiers + 86 feature means).