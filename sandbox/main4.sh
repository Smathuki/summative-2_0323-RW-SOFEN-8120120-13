#!/bin/bash

students_file="students-list_03332.txt"

# Function to create a student record
create_student() {
    echo "Enter student email:"
    read -r email
    echo "Enter student age:"
    read -r age
    echo "Enter student ID:"
    read -r id

    # Save student record to file
    echo "$email|$age|$id" >> "$students_file"
    echo "Student record created successfully."
}

# Function to view all students
view_students() {
    if [[ ! -f "$students_file" ]]; then
        echo "No students found."
    else
        echo "Student records:"
        cat "$students_file"
    fi
}

# Main menu loop
while true; do
    echo "=============================="
    echo "Bachelor of Software Engineering Cohort List"
    echo "=============================="
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Exit"
    echo "=============================="
    echo "Enter your choice:"
    read -r choice

    case $choice in
        1)
            create_student
            ;;
        2)
            view_students
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
