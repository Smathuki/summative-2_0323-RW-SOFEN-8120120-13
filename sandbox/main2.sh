#!/bin/bash

filename="students-list_03332.txt"

while true
do
    echo "------------------------------------"
    echo "Welcome to the Bachelor of Software Engineering Cohort List Application"
    echo "1. Create a student record"
    echo "2. View all students"
    echo "3. Delete a student record"
    echo "4. Update a student record"
    echo "5. Exit the application"
    echo "------------------------------------"
    read -r  "Enter your choice: " choice

    case $choice in
        1)
            read -r "Enter student email: " email
            read -r "Enter student age: " age
            read -r "Enter student ID: " student_id
            echo "$email|$age|$student_id" >> $filename
            echo "Student record created successfully."
            ;;
        2)
            echo "List of students:"
            echo "------------------------------------"
            cat $filename
            echo "------------------------------------"
            ;;
        3)
            read -r  "Enter student ID to delete: " delete_id
            sed -i "/$delete_id/d" $filename
            echo "Student record deleted successfully."
            ;;
        4)
            read -r  "Enter student ID to update: " update_id
            read -r  "Enter new student email: " new_email
            read -r  "Enter new student age: " new_age
            sed -i "/$update_id/c\\$new_email|$new_age|$update_id" $filename
            echo "Student record updated successfully."
            ;;
        5)
            echo "Exiting the application..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
