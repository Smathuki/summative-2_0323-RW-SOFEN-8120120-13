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

# Function to delete a student by ID
delete_student() {
    echo "Enter student ID to delete:"
    read -r id

    # Create a temporary file
    temp_file=$(mktemp)

    # Copy all records except the one to be deleted to the temporary file
    awk -F '|' -v id="$id" '$3 != id' "$students_file" > "$temp_file"

    # Replace the original file with the temporary file
    mv "$temp_file" "$students_file"

    echo "Student deleted successfully."
}

# Function to update a student record by ID
update_student() {
    echo "Enter student ID to update:"
    read -r id

    # Create a temporary file
    temp_file=$(mktemp)

    # Copy all records except the one to be updated to the temporary file
    awk -F '|' -v id="$id" '$3 != id' "$students_file" > "$temp_file"

    # Append the updated record to the temporary file
    echo "Enter updated student email:"
    read -r email
    echo "Enter updated student age:"
    read -r age
    echo "Enter updated student ID:"
    read -r new_id
    echo "$email|$age|$new_id" >> "$temp_file"

    # Replace the original file with the temporary file
    mv "$temp_file" "$students_file"

    echo "Student record updated successfully."
}

# Main menu loop
while true; do
    echo "=============================="
    echo "Bachelor of Software Engineering Cohort List"
    echo "=============================="
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete a student"
    echo "4. Update a student record"
    echo "5. Exit"
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
            delete_student
            ;;
        4)
            update_student
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
