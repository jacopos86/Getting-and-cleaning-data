# Getting-and-cleaning-data
Getting and cleaning data course project

1- the script run_analysis.r first load the zip data if not already present in the working folder

2- then it unzip the file

3- the dataset variable names are saved in "features.txt" file

4- but only standard deviation and mean measurements will be considered in the construction of the final data set

5- the script loads first the data set variables

6- then it moves to the train folder and load the observations data

7- it builds the train data set

8- then it moves to the test folder and load the observation data

9- it build the test data set

10- it merges the two data set

11- and it creates a new data set with the average of every variable for each activity and subject

12- finally the new data set is saved in a file named "final_data.txt"
