# summative-2_Negpod_ID

# Student Cohort Management Application

This application allows you to manage a cohort list of students for a Bachelor of Software Engineering program. It provides various operations such as creating student records, viewing all students, deleting a student record by ID, updating a student record, and extracting student emails.

## main.sh

This script provides the main functionality of the application. It enables users to perform the following operations:

1. Create a student record: Users can input the student's email, age, and ID to add a new student to the cohort list.

2. View all students: Lists all the students currently saved in the cohort list.

3. Delete a student record: Users can remove a student from the cohort list by specifying the student's ID.

4. Update a student record: Allows users to update a student's email and age by providing the student's ID and the new information.

5. Exit the application: Terminates the script and exits the application.

To run the application:
- Save the `main.sh` script in a file named `main.sh`.
- Make sure the `students-list_0333.txt` file is in the same directory as `main.sh`.
- Grant execute permissions to the script using the following command:


This script is used to extract just the emails of the students from the cohort list. It performs the following operation:

- Extract student emails: It reads the `students-list_0333.txt` file and extracts the email addresses of the students, saving them in a file named `student-emails.txt`.

To extract student emails:
- Save the `select-emails.sh` script in a file named `select-emails.sh`.
- Make sure the `students-list_0333.txt` file is in the same directory as `select-emails.sh`.
- Grant execute permissions to the script using the following command:


## select-emails.sh

This script is used to extract just the emails of the students from the cohort list. It performs the following operation:

- Extract student emails: It reads the `students-list_0333.txt` file and extracts the email addresses of the students, saving them in a file named `student-emails.txt`.

To extract student emails:
- Save the `select-emails.sh` script in a file named `select-emails.sh`.
- Make sure the `students-list_0333.txt` file is in the same directory as `select-emails.sh`.
- Grant execute permissions to the script using the following command:
