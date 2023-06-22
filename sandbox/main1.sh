#!/bin/bash

students_file="students-list_0333.txt"

# Function to create a new student record
create_student_record() {
    echo "Enter student email:"
    read -r email
    echo "Enter student age:"
    read -r age
    echo "Enter student ID:"
    read -r student_id
    
    # Append the student record to the file
    echo "$email|$age|$student_id" >> "$students_file"
    echo "Student record created successfully!"
}

# Function to view all student records
view_all_students() {
    echo "List of all students:"
    echo "---------------------"
    cat "$students_file"
}

# Function to delete a student record
delete_student_record() {
    echo "Enter student ID to delete:"
    read -r student_id

    # Create a temporary file
    temp_file=$(mktemp)
    
    # Copy all records except the one with the given student ID to the temporary file
    grep -v "$student_id" "$students_file" > "$temp_file"
    
    # Replace the original file with the temporary file
    mv "$temp_file" "$students_file"
    
    echo "Student record deleted successfully!"
}

# Function to update a student record
update_student_record() {
    echo "Enter student ID to update:"
    read -r student_id

    # Create a temporary file
    temp_file=$(mktemp)
    
    # Prompt the user for updated information
    echo "Enter updated email:"
    read -remail
    echo "Enter updated age:"
    read -rage
    
    # Find the student record with the given ID and update the information
    sed -i "/$student_id/s/[^|]*|[^|]*|/$email|$age|/" "$students_file"
    
    echo "Student record updated successfully!"
}

# Main menu loop
while true; do
    echo "================================"
    echo "Bachelor of Software Engineering"
    echo "================================"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    echo "--------------------------------"
    echo "Enter your choice:"
    read -r choice

    case $choice in
        1)
            create_student_record
            ;;
        2)
            view_all_students
            ;;
        3)
            delete_student_record
            ;;
        4)
            update_student_record
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
