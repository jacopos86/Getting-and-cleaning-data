# Getting-and-cleaning-data
Getting and cleaning data course project

the script run_analysis.r first load the zip data if not already present in the working folder
then it unzip the file
the dataset variable names are saved in "features.txt" file
but only standard deviation and mean measurements will be considered in the construction of the final data set
the script loads first the data set variables
then it moves to the train folder and load the observations data
it builds the test data set
then it moves to the test folder and load the observation data
it build the test data set
it merges the two data set
and it creates a new data set with the average of every variable for each activity and subject
finally the new data set is saved in a file named "final_data.txt"
